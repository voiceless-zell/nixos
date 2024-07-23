{ pkgs, nixpkgs, inputs, config, ... }:
{
  imports = [
  ../../modules/core/program.nix
  ../../modules/core/system.nix
  ../../modules/core/user.nix
  ];
nixpkgs.config.allowUnfree = true;
 networking = {
    hostName = "WSL";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.gvfs.enable = true;
  wsl = {
      enable = true;
      defaultUser = "zell";
      nativeSystemd = true;
      useWindowsDriver = true;
      startMenuLaunchers = true;

  };
nixpkgs.hostPlatform = "x86_64-linux";
    }
