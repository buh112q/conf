{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # ./modules/desktop/niri.nix
    ./modules/desktop/umbriel.nix
    ./modules/desktop/mango.nix
    # ./modules/desktop/hyprland.nix

    ./modules/font.nix
    ./modules/gaming.nix

    ./modules/apps.nix
    ./modules/tmux.nix
    ./modules/nixvim.nix
    # ./modules/nvf.nix
    ./modules/zsh.nix
    ./modules/obs-studio.nix
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # pkgs.linuxPackages_latest
    kernelParams = ["quiet"];
    loader = {
      timeout = 0;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none"; # let resolv handle dns
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];
  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Asia/Bangkok";
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu.initrd.enable = true;
    i2c.enable = true;
    bluetooth.enable = true;
  };
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };
  zramSwap.enable = true;
  systemd.oomd.enable = true; # OutOfMemory killer
  security.rtkit.enable = true; # Pulse&PipeWire use this to acquire realtime priority
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  users.users.sock = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "a";
    extraGroups = [
      "wheel"
      "networkmanager"
      "i2c"
      "ydotool"
    ];
    packages = [];
  };
  services.syncthing = {
    user = "sock";
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/sock/";
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --optimise";
  };
  programs.git.enable = true;
  programs.ydotool.enable = true;
  services.flatpak.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  documentation.enable = false;
  environment.systemPackages = [
    pkgs.unar
    pkgs.pavucontrol
    pkgs.android-tools
    pkgs.keepassxc
    pkgs.qbittorrent-enhanced
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  services.openssh.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
  system.stateVersion = "26.11";
}
