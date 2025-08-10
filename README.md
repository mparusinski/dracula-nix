<h3 align="center">
    Dracula for <a href="https://nixos.org">Nix</a>
</h3>

<p align="center">
    <a href="https://github.com/mparusinski/dracula-nix/stargazers"><img src="https://img.shields.io/github/stars/mparusinski/dracula-nix?style=flat-square"></a>
    <a href="https://github.com/mparusinski/dracula-nix/issues"><img src="https://img.shields.io/github/issues/mparusinski/dracula-nix?style=flat-square"></a>
    <a href="https://github.com/mparusinski/dracula-nix/contributors"><img src="https://img.shields.io/github/contributors/mparusinski/dracula-nix?style=flat-square"></a>

## Previews

**Section not ready**

## Usage

### Installation

Using `flake.nix` include `dracula-nix` to your inputs :

```nix
{
  description = <your code>;
  inputs = {
    <your code>
    dracula.url = "github:mparusinski/dracula-nix";
  };
  outputs = { self, nixpkgs, dracula, ...}@inputs:
  {
    nixosConfigurations.<your hostname> = nixpkgs.lib.nixosSystem {
      <your code>
      modules = [
        <your code>
        dracula.nixosModules.dracula
        inputs.home-manager.nixosModules.home-manager {
          <your code>
          imports = [
            ./home.nix
            dracula.homeModules.dracula
          ];
        };
      ];
    }
  }
}

```

## 💝 Thanks to

- [getchoo](https://github.com/getchoo) For creating Catppuccin Nix port which is an inspiration for this repository

&nbsp;

<p align="center">
	<a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>
