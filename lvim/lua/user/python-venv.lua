-- Point pyright at the project's virtualenv.
--
-- pyright resolves imports against whatever interpreter it is told about, and
-- with no setting it falls back to the first `python` on PATH -- which is the
-- system one, where nothing you pip-installed exists. That's the source of
-- "Import <x> could not be resolved" on a package that is plainly installed.
-- It bites hardest when the venv sits beside the project root rather than in
-- it (e.g. django-tutorial/venv with the code in django-tutorial/myproject),
-- because pyright's own venv autodetection only looks in the root it picked.
--
-- So walk up from the file until a venv turns up and hand pyright its
-- interpreter. Servers pull settings back via workspace/configuration, so the
-- didChangeConfiguration notify is what makes it re-resolve.

local servers = { pyright = true, basedpyright = true }
local venv_names = { ".venv", "venv", "env", ".env" }

---@param dir string
---@return string|nil
local function interpreter_in(dir)
  local python = dir .. "/bin/python"
  return vim.fn.executable(python) == 1 and python or nil
end

---@param path string Path of the file being edited.
---@return string|nil
local function find_interpreter(path)
  -- An activated shell env wins: it's the most explicit signal we have.
  if vim.env.VIRTUAL_ENV then
    local python = interpreter_in(vim.env.VIRTUAL_ENV)
    if python then
      return python
    end
  end

  local dir = vim.fs.dirname(path)
  -- Stop at $HOME: a stray ~/venv must not become every project's interpreter.
  while dir and dir ~= "" and dir ~= "/" and dir ~= vim.env.HOME do
    for _, name in ipairs(venv_names) do
      local python = interpreter_in(dir .. "/" .. name)
      if python then
        return python
      end
    end

    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end

  if vim.env.CONDA_PREFIX then
    return interpreter_in(vim.env.CONDA_PREFIX)
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_python_venv", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not servers[client.name] then
      return
    end

    local python = find_interpreter(vim.api.nvim_buf_get_name(args.buf))
    if not python then
      return
    end

    local settings = client.settings or {}
    if vim.tbl_get(settings, "python", "pythonPath") == python then
      return
    end

    client.settings = vim.tbl_deep_extend("force", settings, {
      python = { pythonPath = python },
    })
    client:notify("workspace/didChangeConfiguration", { settings = client.settings })
  end,
})
