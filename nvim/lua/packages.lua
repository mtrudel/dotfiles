local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[packadd packer.nvim]])

local startup = require("packer").startup

startup({
  function(use, use_rocks)
    use{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    use("overcache/NeoSolarized")
    use("mileszs/ack.vim")
    use("preservim/nerdcommenter")
    use("airblade/vim-gitgutter")
    use("onsails/lspkind-nvim")
    use("preservim/nerdtree")
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("sjbach/lusty")
    use("tveskag/nvim-blame-line")
    use{'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
}
  end,
  config = {
    max_jobs = 30,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
