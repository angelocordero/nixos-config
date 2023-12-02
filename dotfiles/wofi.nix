{ pkgs, config, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      prompt = "";
      insensitive = true;
      no_actions = true;
      width = "20%";
      height = "30%";
    };

    style = ''
      window {
        border-radius: 5px;
	background-color: #${config.colorScheme.colors.base02};
      }

      #input {
        border: 1.5px solid #${config.colorScheme.colors.base0B};
        border-radius: 3px;
	margin: 10px;
	background-color: #${config.colorScheme.colors.base02};
	color: #${config.colorScheme.colors.base06};
      }

      #scroll {
        border: 1.5px solid #${config.colorScheme.colors.base0B};
        border-radius: 3px;
        padding: 10px; 
	margin: 10px;
      }

      #entry {
      	background-color: transparent;
	border: transparent;
	color: transparent;
      }

      #text {
        color:#${config.colorScheme.colors.base06};
      }

      #text:selected {
       color: #${config.colorScheme.colors.base08};
      }
    '';
  };
}
