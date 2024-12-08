let
  colors = {
    bg = "#fbf1f2";
    fg = "#8b8198";
    fg_alt = "#ac9ebe";
    bg_alt = "#e3dadb";
    warn = "#ffaa88";
    error = "#d57e85";
    hint = "#a3b367";
    accent = "#585062";
  };
in
{
  services.polybar = {
    enable = true;
    script = "polybar main 2>&1 | tee -a /tmp/polybar.log & disown";

    config = {
      "bar/main" = {
        bottom = false;
        width = "100%";
        height = "38";
        background = "${colors.bg}";
        foreground = "${colors.fg}";
        padding = 1;
        separator = "::";
        separator-foreground = "${colors.accent}";
        modules-left = [
          "xworkspaces"
          "window"
        ];
        modules-right = [
          "vol"
          "kb"
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

        label-active-foreground = "${colors.accent}";
        label-active-background = "${colors.bg}";
        label-active = "%name%";
        label-active-padding = 1;
        label-active-underline = "${colors.accent}";
        label-active-underline-size = 5;

        label-occupied = "%name%";
        label-occupied-foreground = "${colors.fg}";
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
      };
    };
  };
}
