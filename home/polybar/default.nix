let
  colors = {
    bg = "#101010";
    fg = "#ffffff";
    fg_alt = "#444444";
    bg_alt = "#090909";
    warn = "#ffaa88";
    error = "#d70000";
    hint = "#7788aa";
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
        separator-foreground = "${colors.fg_alt}";
        modules-left = [ "xworkspaces" ];
        override-redirect = true;
        font-0 = "GeistMono Nerd Font:size=14;3";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-monitor = "%name%";
        format = "<label-state>";

        label-active-foreground = "${colors.fg}";
        label-active-background = "${colors.bg}";
        label-active = "%name%";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-foreground = "${colors.fg_alt}";
        label-occupied-background = "${colors.bg}";
        label-occupied-padding = 1;
      };
    };
  };
}
