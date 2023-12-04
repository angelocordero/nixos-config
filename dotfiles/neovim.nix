{ pkgs, ... } : 

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number
      set tabstop=2
      set shiftwidth=2
      set clipboard=unnamedplus
      set hidden
      set inccommand=split
      set title

      hi MatchParen cterm=bold ctermbg=none ctermfg=red
      
			:set guicursor=
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
