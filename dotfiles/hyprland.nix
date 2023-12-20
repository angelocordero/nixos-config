{ pkgs, config, inputs, ... }:

{
  home.packages = [ pkgs.hyprpicker ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
    monitor = HDMI-A-1, 1920x1080@60, 0x0, 1
    monitor = DP-2, 1920x1080@75, 1920x0, 1

    exec-once = swww init
    exec-once = swaync
    exec-once = waybar
    exec-once = /home/angelo/.local/share/hyprload/hyprload.sh
		exec-once = wl-paste --type text --watch cliphist store
		exec-once = wl-paste --type image --watch cliphist store
		exec-once = eww daemon
		exec-once = hyprctl setcursor ComixCursors-White 24

		exec = systemd-cat swww img -o HDMI-A-1 "$HOME/configs/dotfiles/assets/wallpapers/left.png"
		exec = systemd-cat swww img -o DP-2 "$HOME/configs/dotfiles/assets/wallpapers/right.png"

    general {
      gaps_out = 10
      col.active_border = rgba(${config.colorScheme.colors.base0B}ff) rgba(${config.colorScheme.colors.base0D}ff) 45deg
      col.inactive_border= 0xff${config.colorScheme.colors.base03}
      border_size = 3
    }

    decoration {
      rounding = 5
			blur {
				enabled = true
				size = 3
				brightness = 1.0
				contrast = 2.0
			}
   }

    plugin {
      split-monitor-workspaces {
        count = 5
      }
    }

		misc {
			disable_hyprland_logo = true;
		}

    windowrulev2 = float, title:(volctrl)
    windowrulev2 = pin, title:(volctrl)
    windowrulev2 = size 900 400, title:(volctrl)
    windowrulev2 = move 65 650, title:(volctrl)

    bind = SUPER, RETURN, exec, kitty -1
    bind = SUPER, D, exec, wofi --show drun
		bind = SUPER, E, exec, kitty -e yazi

    bind = SUPER_SHIFT, Q, killactive 

    bind = SUPER, Up, movefocus, u
    bind = SUPER, Down, movefocus, d
    bind = SUPER, Left, movefocus, l
    bind = SUPER, Right, movefocus, r

    bind = SUPER_SHIFT, Up, movewindow, u
    bind = SUPER_SHIFT, Down, movewindow, d
    bind = SUPER_SHIFT, Left, movewindow, l
    bind = SUPER_SHIFT, Right, movewindow, r

    bind = SUPER_CONTROL, right, resizeactive, 10 0
    bind = SUPER_CONTROL, left, resizeactive, -10 0
    bind = SUPER_CONTROL, up, resizeactive, 0 -10
    bind = SUPER_CONTROL, down, resizeactive, 0 10

    bindm = SUPER, mouse:272, movewindow
    bindm = SUPER, mouse:273, resizewindow

    bind = SUPER, 1, exec, my-workspace 1
    bind = SUPER, 2, exec, my-workspace 2
    bind = SUPER, 3, exec, my-workspace 3
    bind = SUPER, 4, exec, my-workspace 4
    bind = SUPER, 5, exec, my-workspace 5
    bind = SUPER, 6, exec, my-workspace 6
    bind = SUPER, 7, exec, my-workspace 7
    bind = SUPER, 8, exec, my-workspace 8
    bind = SUPER, 9, exec, my-workspace 9
    bind = SUPER, 0, exec, my-workspace 10

    bind = SUPER_SHIFT, 1, movetoworkspacesilent, 1
    bind = SUPER_SHIFT, 2, movetoworkspacesilent, 2
    bind = SUPER_SHIFT, 3, movetoworkspacesilent, 3
    bind = SUPER_SHIFT, 4, movetoworkspacesilent, 4
    bind = SUPER_SHIFT, 5, movetoworkspacesilent, 5
    bind = SUPER_SHIFT, 6, movetoworkspacesilent, 6
    bind = SUPER_SHIFT, 7, movetoworkspacesilent, 7
    bind = SUPER_SHIFT, 8, movetoworkspacesilent, 8
    bind = SUPER_SHIFT, 9, movetoworkspacesilent, 9
    bind = SUPER_SHIFT, 0, movetoworkspacesilent, 10

    bind = , Print, exec, my-screenshot
    bind = SUPER, Print, exec, my-screenshot-monitor
    bind = SUPER_SHIFT, Print, exec, my-screenshot-region
    bind = SUPER_CONTROL, Print, exec, my-screenshot-region-edit

    bind = , XF86AudioRaiseVolume, exec, swayosd --output-volume raise +3
    bind = , XF86AudioLowerVolume, exec, swayosd --output-volume -3
    bind = , Caps_Lock, exec, sleep .1 && swayosd --caps-lock

		bind = SUPER, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy
    '';
  };
}
