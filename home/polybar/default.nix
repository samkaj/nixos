{
  services.polybar = {
    enable = true;

    config = {
      colors = {
        bg = "#101010";
        fg = "#ffffff";
        fg_alt = "#444444";
        bg_alt = "#090909";
        warn = "#ffaa88";
        error = "#d70000";
        hint = "#7788aa";
      };

      bars = {
        main = {
          bottom = false;
          width = "100%";
          height = "36";
          background = "${colors.bg}";
          foreground = "${colors.fg}";
          padding = 1;
          separator = "::";
          separator-foreground = "${colors.fg_alt}";
          modules-left = [ "xworkspaces" ];
          wm-restack = "i3";
          override-redirect = true;
        };
      };

      modules = {
        xworkspaces = {
          type = "internal/xworkspaces";
          label-monitor = "%name%";
          format = "<label-state>";

          label-active-foreground = "${colors.fg}";
          label-active-background = "${colors.bg}";
          label-active = "%name%";
          label-active-padding = 1;

          label-occupied = "%name%";
          label-occupied-foreground = "${colors.fg}";
          label-occupied-background = "${colors.bg}";
          label-occupied-padding = 1;
        };
      };
    };
  };
}

