{ config, lib, ... }:
let
  mod = "Mod4";
  palette = config.colorScheme.palette;
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
          background = "#${palette.base00}";
          border = "#${palette.base0C}";
          childBorder = "#${palette.base0C}";
          indicator = "#${palette.base0C}";
          text = "#${palette.base0C}";
        };

        unfocused = {
          background = "#${palette.base00}";
          border = "#${palette.base03}";
          childBorder = "#${palette.base03}";
          indicator = "#${palette.base03}";
          text = "#${palette.base03}";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Shift+z" = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";

        "${mod}+Return" = "exec kitty";
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

        "${mod}+Shift+s" = "exec scrot -s -z - | xclip -selection clipboard -target image/png";
      };

      bars = [ ];
    };
    enable = true;
  };
}
