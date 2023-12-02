{ pkgs, config, ... } :

{
  home.file.".config/swaync/config.json".text = ''
    {
      "$schema": "/etc/xdg/swaync/configSchema.json",
      "positionX": "right",
      "positionY": "top",
      "control-center-margin-top": 0,
      "control-center-margin-bottom": 0,
      "control-center-margin-right": 0,
      "control-center-margin-left": 0,
      "control-center-positionX": "none",
      "control-center-positionY": "none",
      "control-center-width": 500,
      "fit-to-screen": true,
      "layer": "overlay",
      "control-center-layer": "overlay",
      "cssPriority": "user",
      "notification-icon-size": 64,
      "notification-body-image-height": 100,
      "notification-body-image-width": 200,
      "notification-inline-replies": true,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "notification-window-width": 500,
      "keyboard-shortcuts": false,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": true,
      "hide-on-action": true,
      "script-fail-notify": true,
      "widgets": [
        "title",
	"mpris",
        "dnd",
        "notifications"
      ],
      "widget-config": {
        "inhibitors": {
          "text": "Inhibitors",
	  "button-text": "Clear All",
          "clear-all-button": true
        },
        "title": {
          "text": "Notification Center",
          "clear-all-button": true,
          "button-text": "Clear All"
        },
        "dnd": {
          "text": "Do Not Disturb"
	},
	"mpris": {
	  "image-size": 64,
	  "image-radius": 5
	}
      }
    }
  '';

  home.file.".config/swaync/style.css".text = ''
    * {
      padding: 0px;
      margin: 0px;
      font-family: JetBrainsMonoNerd Font Mono;
    }

    .notification {
      box-shadow: none;
      margin: 10px;
    }

    .notification-content {
      background: #${config.colorScheme.colors.base02};
      border: 1.5px solid #${config.colorScheme.colors.base0B};
      border-radius: 3px;
      padding: 10px;
    }

    .notification-action:hover,
    .notification-default-action:hover {
      background-color: transparent;
    }

    .notification-row:hover {
      background: transparent;
      box-shadow: none;
    }

    .body {
      background: transparent;
      color: #${config.colorScheme.colors.base04};
      box-shadow: none;
    }

    .summary {
      color: #${config.colorScheme.colors.base06};
      margin-bottom: 5px;
      box-shadow: none;
    }

    .time {
      color: #${config.colorScheme.colors.base04};
      font-size: 14px;
      font-style: italic;
    }

    .control-center {
      background: #${config.colorScheme.colors.base02};
      border-radius: 0px;
      padding: 0px;
      border: 0px solid #${config.colorScheme.colors.base0B};
    }

    .control-center-list-placeholder {
      opacity: 0.0;
    }

    .control-center-list {
      background: transparent;
      margin: 0px;
      padding: 0px;
    }

    .blank-window {
      background: transparent;
    }

    .close-button {
      background: #${config.colorScheme.colors.base02};
      color: #${config.colorScheme.colors.base08};
      border: none;
    }

    .close-button:hover {
      background: #${config.colorScheme.colors.base02};
      color: #${config.colorScheme.colors.base08};
      border: none;
    }


    /*** Widgets ***/

    .widget-title {
      margin: 20px;
      font-size: 1.5rem;
      color: #${config.colorScheme.colors.base06};
    }

    .widget-title > button {
      font-size: initial;
      color: #${config.colorScheme.colors.base08};
      text-shadow: none;
      background: #${config.colorScheme.colors.base02};
      border: 1px solid #${config.colorScheme.colors.base0B};
      box-shadow: none;
      border-radius: 3px;
      padding: 0px 5px 0px 5px;
    }

    .widget-title > button:hover {
      background: #${config.colorScheme.colors.base02};
    }

    .widget-dnd {
      margin: 10px;
      padding: 10px;
      font-size: 1.1rem;
      color: #${config.colorScheme.colors.base04};
      border: 1.5px solid #${config.colorScheme.colors.base0B};
      border-radius: 5px;
    }

    .widget-dnd > switch {
      font-size: initial;
      border-radius: 5px;
      background: #${config.colorScheme.colors.base02};
      border: 1px solid #${config.colorScheme.colors.base0B};
      box-shadow: none;
    }

    .widget-dnd > switch:checked {
      background: #${config.colorScheme.colors.base02};
    }

    .widget-dnd > switch slider {
      background: #${config.colorScheme.colors.base08};
      border-radius: 5px;
      border: 0px solid red;
      box-shadow: none;
    }

    .widget-mpris {
      color: #${config.colorScheme.colors.base06};
      background: #${config.colorScheme.colors.base02};
      border: 1.5px solid #${config.colorScheme.colors.base0B};
      padding: 10px;
      margin: 10px;
      border-radius: 5px;
    }

    .widget-mpris > box > button {
      border-radius: 5px;
    }
  '';
}
