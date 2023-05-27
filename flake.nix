{
  description = "my third attempt at making a  flake lol";

  inputs = {
    # Core inputs. nixpkgs stable, and unstable.
    nixpkgs-stable.url="github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    #Home manager follows unstable
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    #Hyprland

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      # call pkgs.<name>.pkg instead of pkgs.pkg
      # TODO: Remove this it doesnt work no more
      # package-namespace = "wildgoo";

      # call pkgs.<name>.pkg instead of pkgs.pkg
      overlay-package-namespace = "wildgoo";
      #Allowing unfree stuff
      channels-config.allowUnfree = true;

      systems.modules = with inputs; [
        home-manager.nixosModules.home-manager
      ];
      # import everything starting from here
      src = ./.;
    };
}
