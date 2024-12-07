{
  programs.alacritty = {
    enable = true;

    settings = {
      live_config_reload = true;

      env.TERM = "xterm-256color";

      window = {
        padding = {
          x = 8;
          y = 8;
        };
        dynamic_padding = true;
      };

      font = {
        normal = {
          family = "GeistMono Nerd Font";
          style = "Regular";
        };
        size = 12;
        offset = {
          x = -1;
        };
      };

      colors = {
        primary = {
          background = "#161616";
          foreground = "#fffffc";
        };

        normal = {
          black = "#262626";
          magenta = "#ff7eb6";
          green = "#42be65";
          yellow = "#ffe97b";
          blue = "#33b1ff";
          red = "#ee5396";
          cyan = "#3ddbd9";
          white = "#dde1e6";
        };

        bright = {
          black = "#393939";
          magenta = "#ff7eb6";
          green = "#42be65";
          yellow = "#ffe97b";
          blue = "#33b1ff";
          red = "#ee5396";
          cyan = "#3ddbd9";
          white = "#ffffff";
        };
      };
    };
  };
}
