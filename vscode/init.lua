require("config.lazy")

if vim.g.vscode then
    -- VSCode extension
    vim.o.clipboard = 'unnamedplus'
    --
    require('vscode-multi-cursor').setup { -- Config is optional
        -- Whether to set default mappings
        default_mappings = false,
        -- If set to true, only multiple cursors will be created without multiple selections
        no_selection = false
    }

    local cursors = require('vscode-multi-cursor')
    local keymap = vim.api.nvim_set_keymap
    local k = vim.keymap.set
    k({ 'n', 'x' }, 'mc', cursors.create_cursor, { expr = true, desc = 'Create cursor' })
    k({ 'n' }, 'mch', cursors.cancel, { desc = 'Cancel/Clear all cursors' })
    k({ 'n', 'x' }, 'mi', cursors.start_left, { desc = 'Start cursors on the left' })
    k({ 'n', 'x' }, 'mI', cursors.start_left_edge, { desc = 'Start cursors on the left edge' })
    k({ 'n', 'x' }, 'ma', cursors.start_right, { desc = 'Start cursors on the right' })
    k({ 'n', 'x' }, 'mA', cursors.start_right, { desc = 'Start cursors on the right' })
    k({ 'n' }, '[mc', cursors.prev_cursor, { desc = 'Goto prev cursor' })
    k({ 'n' }, ']mc', cursors.next_cursor, { desc = 'Goto next cursor' })
    -- k({ 'n' }, 'mcs', cursors.flash_char, { desc = 'Create cursor using flash' })
    -- k({ 'n' }, 'mcw', cursors.flash_word, { desc = 'Create selection using flash' })
    
    -- vim.keymap.set('n', 'mcd', 'mciw*<Cmd>nohl<CR>', { remap = true })
    vim.keymap.set({'n', 'x', 'i'}, '<C-d>', 'mciw*<Cmd>nohl<CR>', { remap = true }) --not working
    vim.keymap.set({ "n", "x", "i" }, "<C-d>", function() --not working
      vscode.with_insert(function()
        vscode.action("editor.action.addSelectionToNextFindMatch")
      end)
    end)

    -- k('i', "jk", "<ESC>", { remap = true }) --not working

    k('v', "<", "<gv", { remap = true })
    k('v', ">", ">gv", { remap = true }) 
    k('v', '<leader>p', '"_dP', { remap = true }) --not working
    vim.keymap.set('n', 'hola', function()
        print('hello')
    end)

else
    -- ordinary Neovim
end