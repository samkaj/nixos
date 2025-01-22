{ config, pkgs, ... }:
let
  palette = config.colorScheme.palette;
  rofiTheme = pkgs.writeText "samkaj.rasi" ''
    * {
        background-color: #${palette.base00};
        text-color: #${palette.base05};
        border-color: #${palette.base01};
        font: "JetBrainsMono Nerd Font 12";
        padding: 2px 8px;
        vertical-align: 0.5;
    }

    window {
        anchor: south;
        location: south;
        width: 100%;
        padding: 4px;
        children: [ horibox ];
        border: 2px 0 0 0;
        border-color: #${palette.base03};
    }

    horibox {
       orientation: horizontal;
       children: [ prompt, entry, listview ];
    }

    prompt {
       border-color: #${palette.base0C};
       border: 0 2px 0 0;
       horizontal-align: 0;
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
        spacing: 3px;
        background-color: #${palette.base00};
        border-color: #${palette.base00};
    }

    element selected {
        background-color: #${palette.base00};
        border-color: #${palette.base0C};
        border: 0 0 2px 0;
    }
  '';
in
{
  programs.rofi = {
    enable = true;
    theme = "${rofiTheme}";
  };
}
