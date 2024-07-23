{ self
, pkgs
, inputs
, isNIXOS
, ...
}: 
let

in{
 
 #imports = [ inputs.nix-gaming.nixosModules.star-citizen]; #TODO check this
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = if isNIXOS then [ "https://nix-gaming.cachix.org" ] else [];
      trusted-public-keys = if isNIXOS then [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ] else [];   
      };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  

  environment.systemPackages = with pkgs; [
    wget
    git
    nh
    nix-output-monitor
    nvd
    nerdfonts
];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";

}
