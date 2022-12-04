local M = {}

-- vim.api.nvim_set_hl(0, "InputHighlight", { fg = "#ffffff", ctermfg = 255, bg = "#00ff00", ctermbg = 14 })

function M.input(prompt, fn)
  vim.ui.input({
    prompt = prompt,
    -- default = "default value",
    -- completion = "file",
    highlight = function(input)
      if string.len(input) > 8 then
        return { { 0, 8, "InputHighlight" } }
      else
        return {}
      end
    end,
  },
    -- function(input)
    --   if input then
    --     print("You entered " .. input)
    --   else
    --     print "You cancelled"
    --   end
    -- end
    fn
  )
end

-- M.input()

return M
