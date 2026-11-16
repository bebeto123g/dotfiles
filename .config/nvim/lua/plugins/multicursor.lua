return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- Настройка сочетаний клавиш, как в VS Code
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",           -- Ctrl + D: выделить слово и найти следующее
        ["Find Subword Under"] = "<C-d>",   -- Ctrl + D в визуальном режиме
        ["Add Cursor Down"] = "<C-Down>",   -- Ctrl + Стрелка вниз: добавить курсор снизу
        ["Add Cursor Up"] = "<C-Up>",       -- Ctrl + Стрелка вверх: добавить курсор сверху
        ["Mouse Cursor"] = "<C-LeftMouse>", -- Ctrl + ЛКМ: поставить курсор кликом мыши
      }
    end,
  },
}
