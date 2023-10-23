local current_working_dir = vim.fn.system('pwd')
current_working_dir = current_working_dir:gsub('\n', '')

local packer_package_root = current_working_dir..'/packer/site/pack/'

-- Define the path where Packer should be installed
local packer_path = current_working_dir..'/packer/opt/packer.nvim'
vim.o.packpath = packer_path..vim.o.packpath

-- Specify the location for Packer to build plugins
local packer_compiled_path = current_working_dir..'/packer/plugin/packer_compiled.lua'

-- If Packer is not installed, clone it
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').init({
    compile_path = packer_compiled_path,
    package_root = packer_package_root
})


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
end)

