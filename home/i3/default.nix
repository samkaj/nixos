{
  lib,
  ...
}:
let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    extraConfig = ''
      default_border pixel 1
      default_floating_border normal
      for_window [class="^.*"] border pixel
    '';
    config = {
      modifier = mod;

      startup = [
        { command = "systemctl --user restart polybar"; }
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
          background = "#444444";
          border = "#444444";
          childBorder = "#444444";
          indicator = "#444444";
          text = "#444444";
        };

        unfocused = {
          background = "#080808";
          border = "#080808";
          childBorder = "#080808";
          indicator = "#080808";
          text = "#080808";
        };
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec dmenu_run";
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
