{ config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        layer = "top";
        position = "left";
        width = 40;
        margin = "5";
        all-outputs = false;
        output = [
          "HDMI-A-1"
        ];
        modules-left = [ "image" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "wireplumber" "custom/notification" "network" "tray" ];

        "mpris" = {
          format = "{player_icon}\n{status_icon}";
          format-paused = "{player_icon}\n{status_icon}";
          tooltip-format = "{player} | {dynamic} | {position} / {length}";
          player-icons = {
            firefox = "";
            spotify = "";
          };
          status-icons = {
            playing = "󰐊";
            paused = "󰏤";
          };
        };

        "network" = {
          interface = "eno1";
          format = "󰌘";
          format-disconnected = "󰌙";
          tooltip-format = "<tt>{ipaddr}</tt>";
          tooltip-format-disconnected = "<tt>Disconnected</tt>";
          tooltip = true;
        };

        "wireplumber" = {
          format = "<span font='20'>{icon}</span>\n{volume}%";
          format-muted = "󰖁";
          format-icons = [ "" "" "" ];
          scroll-step = 3.0;
          tooltip = false;
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click = "volctrl";
        };

        "clock" = {
          format = "{:%I\n%M\n%p}";
          tooltip-format = "<tt>{:%I:%M %p, %B %d, %Y}</tt>";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
            empty = "";
            urgent = "";
          };
          persistent-workspaces = {
            "HDMI-A-1" = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              10
            ];
          };
          sort-by = "id";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂚";
            dnd-notification = "󰅸";
            dnd-none = "󰪑";
            inhibited-notification = "󰅸";
            inhibited-none = "󱏬";
            dnd-inhibit-notification = "󰅸";
            dnd-inhibit-none = "󱏬";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "image" = {
          path = "/home/angelo/configs/dotfiles/assets/nix-snowflake.svg";
          size = 26;
          on-click = "sleep .1 && wofi --show drun";
          interval = 1;
        };
      };
    };
    style = ''
            * {
              border-radius: 3px;
              font-family: JetBrainsMono Nerd Font Mono;
              min-height: 0;
      	font-size: 20px;
            }

            window#waybar {
              background-color: transparent;
      	color: #${config.colorScheme.colors.base06};
      	border-radius: 0px;
      	margin: 0px;
      	padding: 0px;
            }

            #mpris,
            #network {
              font-size: 25px;
      	background-color: #${config.colorScheme.colors.base02};
      	border: 1px solid #${config.colorScheme.colors.base0B};
      	padding-top: 5px;
      	padding-bottom: 5px;
      	margin-top: 5px;
      	margin-bottom: 5px;
            }


            #wireplumber {
              font-size: 14px;
      	background-color: #${config.colorScheme.colors.base02};
      	border: 1px solid #${config.colorScheme.colors.base0B};
      	padding-top: 5px;
      	padding-bottom: 5px;
      	margin-top: 5px;
      	margin-bottom: 5px;
            }

            #clock {
              border: 1px solid #${config.colorScheme.colors.base0B};
      	background-color: #${config.colorScheme.colors.base02};
      	padding-top: 5px;
      	padding-bottom: 5px;
      	font-size: 16px;
            }

            #image {
              border: 1px solid #${config.colorScheme.colors.base0B};
      	background-color: #${config.colorScheme.colors.base02};
      	padding-top: 5px;
      	padding-bottom: 5px;
      	margin-top: 5px;
      	margin-bottom: 5px;
            }

            #workspaces {
              border: 1px solid #${config.colorScheme.colors.base0B};
      	padding-top: 5px;
      	padding-bottom: 5px;
      	background-color: #${config.colorScheme.colors.base02};
      	margin-top: 5px;
      	margin-bottom: 5px;
            }

            #workspaces button {
              color: #${config.colorScheme.colors.base06};
      	padding: 0px;
      	margin: 0px;
            }

            #workspaces button:hover {
              background: transparent; 
      	border: 0px solid transparent;
      	box-shadow: none;
            }

            #workspaces button.active {
              color: #${config.colorScheme.colors.base0D}
            }

            #workspaces button.empty {
              color: #${config.colorScheme.colors.base04};
            }

            #workspaces button.urgent {
              color: #${config.colorScheme.colors.base0D};
            }

            #tray {
      	background-color: #${config.colorScheme.colors.base02};
              border: 1px solid #${config.colorScheme.colors.base0B};
      	padding-top: 5px;
      	padding-bottom: 5px;
              margin-top: 5px;
      	margin-bottom: 10px;
            }

            #custom-notification {
              padding-top: 5px;
      	padding-bottom: 5px;
      	margin-top: 5px;
      	margin-bottom: 5px;
              background-color: #${config.colorScheme.colors.base02};
              border: 1px solid #${config.colorScheme.colors.base0B};
      	font-size: 20px;
            }

            tooltip {
              background: #${config.colorScheme.colors.base02};
      	border: 1.5px solid #${config.colorScheme.colors.base0B};
            }

            tooltip label {
              font-size: 14px;
            }
    '';
  };
}
