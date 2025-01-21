{ config, pkgs, ... }:
let
  palette = config.colorScheme.palette;
  rofiTheme = pkgs.writeText "samkaj.rasi" ''
    * {
        background-color: #${palette.base00};
        text-color: #${palette.base05};
        border-color: #${palette.base01};
        font: "JetBrainsMono Nerd Font 12";
    }

    window {
        anchor: south;
        location: south;
        width: 100%;
        padding: 4px;
        children: [ horibox ];
    }

    horibox {
        orientation: horizontal;
        children: [ prompt, entry, listview ];
    }

    listview {
        layout: horizontal;
        spacing: 5px;
        lines: 10;
    }

    entry {
        expand: false;
        width: 10em;
    }

    element {
        padding: 0px 3px;
    }

    element selected {
        background-color: #${palette.base02};
    }
  '';
in
{
  programs.rofi = {
    enable = true;
    theme = "${rofiTheme}";
  };
}
