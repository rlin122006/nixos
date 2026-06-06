{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    
    initLua = ''
      vim.api.nvim_set_hl(0,"Normal",{bg = "NONE"})
      vim.api.nvim_set_hl(0,"NormalNC",{bg = "NONE"})
      vim.api.nvim_set_hl(0,"SignColumn",{bg = "NONE"})

      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.tabstop = 2
    '';
  };
}
