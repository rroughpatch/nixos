{ config, pkgs, ... }:

{
  home = {
    username = "lyra";
    homeDirectory = "/home/lyra";
    stateVersion = "25.05";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "yves";
      userEmail = "rroughpatch@proton.me";
      extraConfig = { init.defaultBranch = "main"; };
    };

    helix = {
      enable = true;
      settings = {
        theme = "autumn_night_transparent";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };

      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }];
    };

    vesktop = {
      enable = true;
      settings = {
        autoUpdate = false;
        plugins = {
          MessageLogger = {
            enable = true;
            ignoreSelf = true;
          };
        };
      };
    };
  };
}
