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
  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.gpg.enable = true;
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
      PATH="$HOME/bin:$NIX_PATH:$PATH";
    };
    # this is slow, kill this later
    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
        "git"
        "command-not-found"
        "autojump"
      ];
    };

    initExtra = ''
      [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

      eval $(thefuck --alias)

      function squash() { git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD)); }

      alias ls="exa -l --icons"

      PATH="$HOME/bin:$NIX_PATH:$PATH";
    '';
  };

  programs.go = {
    enable = true;
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
}
