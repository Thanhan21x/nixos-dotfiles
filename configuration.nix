{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";


  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };
  services.displayManager.ly.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

#services.upower.enable;

  users.users.nhan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;
  programs.dms-shell = {
    enable = true;

    systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
	  };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
	};

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    alacritty
    thunar
    git
    zsh
    fuzzel
    brightnessctl
    evince
    zoxide
    upower
    zip
    unzip
    obsidian
    distrobox
  ];

  services.upower.enable = true;

  fonts.packages = with pkgs; [
  	nerd-fonts.hack
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  system.stateVersion = "26.05"; 

}

