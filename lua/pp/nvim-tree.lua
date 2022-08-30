local nvim_tree = require 'nvim-tree'

nvim_tree.setup {
    auto_reload_on_write               = true,
    create_in_closed_folder            = false, -- true by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when false, and inside the folder when true.
    disable_netrw                      = true, -- disables netrw completely
    hijack_cursor                      = false, -- hijack the cursor in the tree to put it at the start of the filename
    hijack_netrw                       = false, -- hijack netrw window on startup
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup             = false,
    open_on_setup                      = false, -- open the tree when running this setup function
    open_on_setup_file                 = false,
    open_on_tab                        = true, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    sort_by                            = "name", -- will not open on setup if the filetype is in this list
    update_cwd                         = false, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    respect_buf_cwd                    = true, -- false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
    view                               = {
        adaptive_size = false,
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 50,
        height = 30,
        hide_root_folder = false,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            -- list of mappings to set on the tree manually
            list = {}
        },
    },
    renderer                           = {
        add_trailing           = true, -- false by default, append a trailing slash to folder names
        group_empty            = true, -- false by default, compact folders that only contain a single folder into one node in the file tree
        highlight_git          = true, -- false by default, will enable file highlight for git attributes (can be used without the icons).
        highlight_opened_files = "none",
        root_folder_modifier   = ':~', -- This is the default. See :help filename-modifiers for more options
        indent_markers         = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons                  = {
            webdev_colors = true,
            git_placement = "before",
            padding       = ' ', -- one space by default, used for rendering the space between the icon and the filename.
            symlink_arrow = ' >> ', --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
            show          = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = true,
            },
            glyphs        = {
                default = '',
                symlink = '',
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                },
            },
        },
        --  List of filenames that gets highlighted with NvimTreeSpecialFile
        special_files          = { "README.md", "Makefile" },
    },
    hijack_directories                 = {
        enable = true,
        auto_open = true,
    },
    update_focused_file                = {
        -- enables the feature
        enable      = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd  = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = { '.git' }, -- empty by default
    },
    ignore_ft_on_setup                 = {},
    -- configuration options for the system open command (`s` in the tree by default)
    system_open                        = {
        -- the command to run this, leaving nil should work in most cases
        cmd  = nil,
        -- the command arguments as a list
        args = {}
    },
    -- show diagnostics in the signcolumn
    diagnostics                        = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    filters                            = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git                                = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions                            = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash                              = {
        cmd = "trash",
        require_confirm = true
    },
    log                                = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
}

vim.keymap.set('n', '<leader>n', nvim_tree.toggle)
