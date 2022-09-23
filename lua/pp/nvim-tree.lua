local nvim_tree = require 'nvim-tree'

nvim_tree.setup {
    disable_netrw                      = true, -- disables netrw completely
    hijack_netrw                       = false, -- hijack netrw window on startup
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup             = false,
    open_on_tab                        = true, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    respect_buf_cwd                    = true, -- false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
    view                               = {
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 50,
    },
    renderer                           = {
        add_trailing           = true, -- false by default, append a trailing slash to folder names
        group_empty            = true, -- false by default, compact folders that only contain a single folder into one node in the file tree
        highlight_git          = true, -- false by default, will enable file highlight for git attributes (can be used without the icons).
        icons                  = {
            show          = {
                file = false,
                folder = false,
                folder_arrow = false,
            },
        },
    },
    update_focused_file                = {
        -- enables the feature
        enable      = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_root  = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = { '.git' }, -- empty by default
    },
    actions                            = {
        open_file = {
            quit_on_open = true,
            resize_window = false,
        },
    },
}

vim.keymap.set('n', '<leader>n', nvim_tree.toggle)
