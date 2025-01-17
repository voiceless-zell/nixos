
{ pkgs, inputs, config, nixpkgs, isNIXOS, ... }: {
  imports = [
      ./hardware-configuration.nix
      ./nix.nix
      ./homemanager.nix
      ./../../modules/core/steam.nix
      ./../../modules/core/virtualisation.nix
      ./../../modules/core/pipewire.nix
      ./../../modules/core/program.nix
      ./../../modules/core/security.nix
      ./../../modules/core/services.nix
      ./../../modules/core/system.nix
      ./../../modules/core/user.nix
      ./../../modules/core/wayland.nix
#     ./../../modules/core/obsidian.nix
    ];
}

