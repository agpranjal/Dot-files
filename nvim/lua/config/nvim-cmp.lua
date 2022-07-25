local M = {}

function M.setup()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  local luasnip = require "luasnip"
  local cmp = require "cmp"

  cmp.setup {
    completion = { completeopt = "menu,menuone,preview", keyword_length = 1 },
    experimental = { native_menu = false, ghost_text = true },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      format = function(entry, vim_item)
        local menu = ({
          nvim_lsp = "[LSP]",
          cmp_tabnine = "[TabNine]",
          treesitter = "[Treesitter]",
          buffer = "[Buffer]",
          luasnip = "[Snip]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          spell = "[Spell]",
        })[entry.source.name]

        -- Max width of the completion menu
        vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

        -- TabNine integration
        if entry.source.name == "cmp_tabnine" then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. menu
          end
          vim_item.kind = ""
        end

        vim_item.menu = menu

        return vim_item
      end,
    },
    mapping = {
      ["<up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
      -- ["<esc>"] = cmp.mapping(cmp.mapping.close(), { "i" }),
      ["<down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
      --["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
      ["<pageup>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
      --["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
      ["<pagedown>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.close() },
      -- ["<CR>"] = cmp.mapping {
      --   i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
      -- },
      ["<Tab>"] = cmp.mapping {
        i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      },
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "cmp_tabnine" },
      --{ name = "treesitter" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "spell" },
      { name = "nvim_lsp_signature_help" }
    },
    window = {
      -- completion = cmp.config.window.bordered({
      --   -- winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
      --   -- winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
      -- }),
      -- documentation = cmp.config.window.bordered(),
      completion = {
        border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
        winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
      },
      documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      }
    },
  }

  vim.cmd "highlight! link CmpPmenu         Pmenu"
  vim.cmd "highlight! link CmpPmenuBorder   Pmenu"

  -- Auto pairs
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  -- Tabnine
  local tabnine = require "cmp_tabnine.config"
  tabnine:setup { max_lines = 1000, max_num_results = 20, sort = true }
end

return M
