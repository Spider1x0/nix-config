{
  description = "my third attempt at making a  flake lol";

  inputs = {
      # Core inputs. nixpkgs stable, and unstable.

      #nixpkgs-stable.url="github:nixos/nixpkgs/nixos-23.05";
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      sops-nix.url = "github:Mic92/sops-nix";
      sops-nix.inputs.nixpkgs.follows = "nixpkgs";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      # Some stuff that i use
      nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

      snowfall-lib = {
        url = "github:snowfallorg/lib";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      # call pkgs.<name>.pkg instead of pkgs.pkg
      # TODO: Remove this it doesnt work no more
      #package-namespace = "wildgoo";
      snowfall = {
        namespace="wildgoo";
      };

      # call pkgs.<namespace>.pkg instead of pkgs.pkg
      # TODO Old option, no longer works. replaced with snowfall.namespace
      #overlay-package-namespace = "wildgoo";
      #Allowing unfree stuff
      channels-config.allowUnfree = true;
      systems.modules.nixos = with inputs; [
      ];

      # import everything starting from here
      src = ./.;
    };
}
