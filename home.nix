{pkgs, ...}: {
  home = {
    username = "lyra";
    homeDirectory = "/home/lyra";
    stateVersion = "25.05";
  };

  programs = {
    home-manager.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";

        dot = "cd ~/dotfiles";

        cd = "z";

        ls = "eza --icons=always --color=always";
        la = "eza -la --icons=always --color=always";
        l = "eza -l --icons=always --color=always";

        cat = "bat";
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      userName = "yves";
      userEmail = "rroughpatch@proton.me";
      extraConfig = {init.defaultBranch = "main";};
    };

    eza = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat.enable = true;

    thefuck = {
      enable = true;
      alias = "fuck";
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

      languages = {
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${pkgs.alejandra}/bin/alejandra";
            language-servers = ["nil"];
          }
        ];
      };
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
