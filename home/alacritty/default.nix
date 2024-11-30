{
  programs.alacritty = {
    enable = true;

    settings = {
      live_config_reload = true;

      window = {
        padding = { x = 8; y = 8; };
        dynamic_padding = true;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 12;
      };

      colors = {
        primary = {
          background = "#101010";
        };

        normal = {
          black = "#080808";
          red = "#D70000";
          green = "#789978";
          yellow = "#FFAA88";
          blue = "#7788AA";
          magenta = "#D7007D";
          cyan = "#708090";
          white = "#DEEEED";
        };
      };
    };
  };
}

