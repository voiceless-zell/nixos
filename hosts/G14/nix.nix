{ pkgs, inputs, config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "amdgpu" ];
  boot.kernel.sysctl = {
  "vm.max_map_count" = 20971520;
  "fs.file-max" = 524288;
};
nixpkgs.config.allowUnfree = true;
 networking = {
    hostName = "G14";
  };
  zramSwap.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia"  "modesetting" ];
    desktopManager.gnome = {
        enable = true;
        };
        libinput = {
        enable = true;
        mouse = {
            accelProfile = "flat";
          };
      };
    };
    hardware = {
      nvidia = {
          modesetting.enable = true;
          powerManagement.enable = false;
          open = false;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
          nvidiaSettings = true;
          prime = {
              amdgpuBusId = "PCI:4:0:0";
              nvidiaBusId = "PCI:1:0:0";
            };
        };
      opengl = {
        enable = true;
        extraPackages = with pkgs; [
        ];
      };
    };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.gvfs.enable = true;
  #services.tailscale = {
  #  enable = true;
  #  useRoutingFeatures = "client";
  #  };
    services.asusd.enable = true;
}
