{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packages;
      star-citizen = pkgs.star-citizen.override (prev: {
          wineDllOverrides = prev.wineDllOverrides ++ [ "dxgi=n" ];
        });
    in {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # others
      bitwarden
      p7zip
      neofetch
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      htop
      nvtopPackages.full
      fzf
      ffmpeg
      discord
      eza
      obsidian
      glib
      #programming
      nix-prefetch-github
      #Tmux things stdin/write to file
      moreutils
      libcxxStdenv
# security
    x11_ssh_askpass
#lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      inputs.nix-citizen.packages.${system}.star-citizen
      inputs.nix-citizen.packages.${system}.star-citizen-helper
      inputs.nix-citizen.packages.${system}.lug-helper
      lutris
      wine64
      winetricks
      python312Packages.huggingface-hub
      ferium
    #  minecraft
];
    };
}
