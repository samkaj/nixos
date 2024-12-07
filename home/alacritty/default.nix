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
          background = "#fbf1f2";
          foreground = "#8b8198";
        };

        normal = {
          black = "#bfb9c6";
          red = "#d57e85";
          green = "#a3b367";
          yellow = "#dcb16c";
          blue = "#7297b9";
          magenta = "#bb99b4";
          cyan = "#69a9a7";
          white = "#f2f1f4";
        };

        bright = {
          black = "#72677e";
          red = "#d57e85";
          green = "#a3b367";
          yellow = "#dcb16c";
          blue = "#7297b9";
          magenta = "#bb99b4";
          cyan = "#69a9a7";
          white = "#585062";
        };
      };
    };
  };
}
