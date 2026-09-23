{ inputs, config, pkgs, zen-browser, ... }:

let 
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    niri = "niri";
    zsh = "zsh";
  };

in

{
  home.username = "nhan";
  home.homeDirectory = "/home/nhan";
  programs.git.enable = true;
  home.stateVersion = "26.05";
  programs.zsh = {
    enable = true;
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
     source = create_symlink "${dotfiles}/${subpath}";
     recursive = true;
    })
  configs;
    
  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    fzf
    fastfetch
  ];

  programs.obsidian = {
    enable = true;

    vaults.notes.target = "~/Obsidian Vault";

    defaultSettings.app = {
      alwaysUpdateLinks = true;
      spellcheck = true;
    };
  };

  imports = [
    zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

}

