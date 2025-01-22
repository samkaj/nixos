{ pkgs, config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  services.polybar = {
    package = pkgs.polybar.override { pulseSupport = true; };

    enable = true;
    script = "polybar >> /tmp/polybar.log 2>&1 & disown";

    config = {
      "bar/main" = {
        bottom = false;
        width = "100%";
        height = "38";
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        border-bottom-size= 1;
        border-color = "#${palette.base03}";
        padding = 1;
        separator = "::";
        separator-foreground = "#${palette.base03}";
        separator-padding = 1;
        modules-left = [
          "xworkspaces"
          "window"
        ];
        modules-right = [
          "mem"
          "cpu"
          "eth"
          "vol"
          "kb"
          "date"
        ];
        override-redirect = true;
        font-0 = "JetBrainsMono Nerd Font:size=12;3";
        font-1 = "JetBrainsMono Nerd Font:size=12;4";
        line-size = 2;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-monitor = "%name%";
        format = "<label-state>";

        label-active-foreground = "#${palette.base05}";
        label-active-background = "#${palette.base00}";
        label-active = "%name%";
        label-active-padding = 1;
        label-active-underline = "#${palette.base0C}";
        label-active-underline-size = 5;

        label-occupied = "%name%";
        label-occupied-foreground = "#${palette.base05}";
        label-occupied-background = "#${palette.base00}";
        label-occupied-padding = 1;
      };

      "module/window" = {
        type = "internal/xwindow";
        format-background = "#${palette.base00}";
        format-foreground = "#${palette.base05}";
        label-maxlen = 50;
        format-padding = 1;
      };

      "module/kb" = {
        type = "internal/xkeyboard";
        label-layout = "%name%";
      };

      "module/vol" = {
        type = "internal/pulseaudio";
        label-volume = "%percentage%%";
        format-volume = "<label-volume>";
        format-volume-prefix = "  ";
        format-volume-prefix-foreground = "#${palette.base0C}";
        format-muted = "";
        format-muted-foreground = "#${palette.base08}";
      };

      "module/date" = {
        type = "internal/date";
        date = "%a %d";
        time = "%H:%M";

        format = "<label>";
        label = "%date%, %time%";
        label-foreground = "#${palette.base05}";
      };

      "module/wifi" = {
        format-connected = "<ramp-signal> <label-connected>";
        label-connected = "%downspeed:9%";

        ramp-signal-0-foreground = "#${palette.base08}";
        ramp-signal-0 = "󰤫 ";
        ramp-signal-1 = "󰤯 ";
        ramp-signal-2 = "󰤟 ";
        ramp-signal-3 = "󰤢 ";
        ramp-signal-4 = "󰤥 ";
        ramp-signal-5 = "󰤨 ";
      };

      "module/eth" = {
        type = "internal/network";
        interface-type = "wired";
        interface = "enp34s0"; # can I use a wildcard?

        format-connected = "<label-connected>";
        format-connected-prefix = " ";
        format-connected-prefix-foreground = "#${palette.base0C}";
        label-connected = "%downspeed% | %upspeed%";
        label-disconnected = "󰈂";
        label-disconnected-foreground = "#${palette.base08}";
      };

      "module/cpu" = {
        type = "internal/cpu";
        format = "<label>";
        format-prefix = "%{T2}  ";
        format-prefix-foreground = "#${palette.base0C}";
        label = "%percentage%%";
      };

      "module/mem" = {
        type = "internal/memory";
        format = "<label>";
        format-prefix = "%{T2}  ";
        format-prefix-foreground = "#${palette.base0C}";
        label = "%gb_used%";
        format-warn-foreground = "#${palette.base08}";
      };
    };
  };
}
