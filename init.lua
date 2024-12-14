require("rostislavarts.packer")
require("rostislavarts.remap")

--vim.cmd[[colorscheme tokyonight-storm]]
vim.cmd[[colorscheme gruvbox]]
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Support for highlighting in Bython
vim.filetype.add({
    extension = {
        by = "python",
    },
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('code_runner').setup({
    filetype = {
        java = {
            "cd $dir &&",
            "java $fileName"
        },
        go = {
            "cd $dir &&",
            "go build $fileName &&",
            "$dir/$fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt"
        },
        c = function(...)
            c_base = {
                "cd $dir &&",
                "gcc $fileName -o",
                "/tmp/$fileNameWithoutExt",
            }
            local c_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
                c_base[4] = input
                vim.print(vim.tbl_extend("force", c_base, c_exec))
                require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
            end)
        end,
    },
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "lua", "java", "rust", "python", "html", "javascript", "typescript", "sql", "markdown", "markdown_inline", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

--require('mini.completion').setup()

-- Autocompletion setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").gopls.setup({capabilities = capabilities})
require("lspconfig").clangd.setup({capabilities = capabilities})
require("lspconfig").jdtls.setup({capabilities = capabilities})
require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
})
