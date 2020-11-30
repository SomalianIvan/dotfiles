{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.thefuck
    pkgs.python3
    pkgs.python
    pkgs.ruby
    pkgs.yarn
    pkgs.exa
  ];

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    sessionVariables = rec {
      HOME_MANAGER_CONFIG = "$HOME/.config/nixpkgs/home.nix";
      DEV_ALLOW_ITERM2_INTEGRATION = "1";

      EDITOR = "nvim";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;

      GOPATH = "$HOME";
      PATH="$NIX_PATH:$PATH:$GOPATH/bin";
    };
    # this is slow, kill this later
    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
        "git"
        "command-not-found"
        "autojump"
        "ruby"
      ];
    };

    initExtra = ''
      [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

      eval $(thefuck --alias)

      function squash() { git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD)); }

      alias ls="exa -l --icons"
    '';
  };

  programs.go = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    withPython3 = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./config.vim;
    plugins = with pkgs.vimPlugins; [
      vim-dispatch
      neomake
      tagbar
      vim-fugitive
      vim-ruby
      vim-rails
      goyo
      nerdcommenter
      vim-unimpaired
      vim-markdown
      vim-sensible
      vim-test
      vim-surround
      vim-pencil
      auto-pairs
      vim-polyglot
      gruvbox
      vim-rhubarb
      vim-jinja
      taglist-vim
      ale
      lightline-vim
      lightline-ale
      neoformat
      vim-gitgutter
      vim-signify
      vim-gutentags
      vim-repeat
      vim-javascript
      vim-startify
      vim-indent-guides
      deoplete-nvim
      fzf-vim
      vim-rooter
      vimwiki
      # themes
      papercolor-theme
      jellybeans-vim
    ];
  };

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    extraConfig = ''
      [user]
          name = Timur Borkhodoev
          email = tim.borkhodoev@shopify.com
      [core]
          editor = nvim
          commitGraph = true
          excludesfile = /Users/terrpi/.gitignore
      [diff]
          algorithm = patience
      [gc]
          writeCommitGraph = true
      [protocol]
          version = 2
      [url "https://github.com/Shopify/"]
          insteadOf = git@github.com:Shopify/
          insteadOf = git@github.com:shopify/
          insteadOf = ssh://git@github.com/Shopify/
          insteadOf = ssh://git@github.com/shopify/
      [push]
          default = current
      [credential]
          helper = store --file /opt/dev/var/private/git_credential_store
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 20;
        normal = {
          family = "ProggyCleanTT Nerd Font Mono";
        };
      };

      colors = {
        primary = {
          background = "0x121212";
          foreground = "0xdedede";
        };

        normal = {
          black =   "0x929292";
          red =     "0xe27373";
          green =   "0x94b979";
          yellow =  "0xffba7b";
          blue =    "0x97bedc";
          magenta = "0xe1c0fa";
          cyan =    "0x00988e";
          white =   "0xdedede";
        };
        bright = {
          black =   "0xbdbdbd";
          red =     "0xffa1a1";
          green =   "0xbddeab";
          yellow =  "0xffdca0";
          blue =    "0xb1d8f6";
          magenta = "0xfbdaff";
          cyan =    "0x1ab2a8";
          white =   "0xffffff";
        };
      };
    };
  };
}
