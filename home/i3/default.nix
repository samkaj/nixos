{ lib, ... }:
let
  mod = "Mod4";
in
{
  xsession.initExtra = "xset r rate 250 50";
  xsession.windowManager.i3 = {
    extraConfig = ''
      default_border pixel 1
      default_floating_border normal
      for_window [class="^.*"] border pixel
    '';
    config = {
      modifier = mod;

      startup = [
        { command = "systemctl --user start polybar"; }
        { command = "feh --bg-scale ~/wallpaper.jpg"; } # uh oh not reproducible
      ];

      gaps = {
        inner = 4;
        outer = 1;
        top = 28;
        smartBorders = "on";
      };

      fonts = {
        names = [ "GeistMono Nerd Font" ];
        style = "Regular";
        size = 11.0;
      };

      floating.titlebar = false;

      modes = {
        resize = {
          k = "resize grow height 10 px or 10 ppt";
          Escape = "mode default";
          h = "resize shrink width 10 px or 10 ppt";
          Return = "mode default";
          l = "resize grow width 10 px or 10 ppt";
          j = "resize shrink height 10 px or 10 ppt";
        };
      };

      colors = {
        focused = {
          background = "#6e6a86";
          border = "#6e6a86";
          childBorder = "#6e6a86";
          indicator = "#6e6a86";
          text = "#6e6a86";
        };

        unfocused = {
          background = "#191724";
          border = "#191724";
          childBorder = "#191724";
          indicator = "#191724";
          text = "#191724";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Return" = "exec alacritty";
        "${mod}+Shift+q" = "kill";
        "${mod}+r" = "mode resize";

        "${mod}+v" = "split v";
        "${mod}+b" = "split h";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+space" = "floating toggle";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

      };

      bars = [ ];
    };
    enable = true;
  };
}
