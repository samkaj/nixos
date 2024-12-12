{ pkgs, ... }:
let
  colors = {
    bg = "#191724";
    fg = "#e0def4";
    fg_alt = "#908caa";
    bg_alt = "#1f1d2e";
    warn = "#f6c177";
    error = "#eb6f92";
    hint = "#c4a7e7";
    accent = "#403d52";
    sep = "#524f67";
  };
in
{
  services.polybar = {
    enable = true;
    script = "polybar main & disown";

    config = {
      "bar/main" = {
        bottom = false;
        width = "100%";
        height = "38";
        background = "${colors.bg}";
        foreground = "${colors.fg}";
        padding = 1;
        separator = "::";
        separator-foreground = "${colors.sep}";
        separator-padding = 1;
        modules-left = [
          "xworkspaces"
          "window"
        ];
        modules-right = [
          "eth"
          "vol"
          "kb"
          "date"
        ];
        override-redirect = true;
        font-0 = "GeistMono Nerd Font:size=15;3";
        font-1 = "GeistMono Nerd Font:size=15;4";
        line-size = 2;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-monitor = "%name%";
        format = "<label-state>";

        label-active-foreground = "${colors.fg}";
        label-active-background = "${colors.bg}";
        label-active = "%name%";
        label-active-padding = 1;
        label-active-underline = "${colors.accent}";
        label-active-underline-size = 5;

        label-occupied = "%name%";
        label-occupied-foreground = "${colors.fg_alt}";
        label-occupied-background = "${colors.bg}";
        label-occupied-padding = 1;
      };

      "module/window" = {
        type = "internal/xwindow";
        format-background = "${colors.bg}";
        format-foreground = "${colors.fg}";
        label-maxlen = 50;
        format-padding = 1;
      };

      "module/kb" = {
        type = "internal/xkeyboard";
        label-layout = "%name%";
      };

      "module/vol" = {
        type = "internal/alsa";
        master-soundcard = "default";
        mixer = "Master";
        label-volume = "%percentage%%";
        format-volume = "<label-volume>";
        format-volume-prefix = "  ";
        format-volume-prefix-foreground = "${colors.accent}";
        format-muted = "  ";
        format-muted-foreground = "${colors.error}";
      };

      "module/date" = {
        type = "internal/date";
        date = "%a %d";
        time = "%H:%M";

        format = "<label>";
        label = "%date%, %time%";
        label-foreground = "${colors.fg}";
      };

      "module/wifi" = {
        format-connected = "<ramp-signal> <label-connected>";
        label-connected = "%downspeed:9%";

        ramp-signal-0-foreground = "${colors.error}";
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
        format-connected-prefix-foreground = "${colors.accent}";
        label-connected = "%downspeed% | %upspeed%";
        label-disconnected = "󰈂";
        label-disconnected-foreground = "${colors.error}";
      };
    };
  };
}
