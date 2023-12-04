{ pkgs, config, ... } :

{
	home.sessionVariables = {
		TERMINAL = "alacritty";
	};

	home.packages = [ pkgs.alacritty ];
  
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
	  x = 10;
	  y = 10;
	};
      };
      cursor.style.shape = "Beam";
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
	  style = "Regular";
	};
	bold = {
          family = "JetBrainsMono Nerd Font Mono";
	  style = "Bold";
	};
	italic = {
          family = "JetBrainsMono Nerd Font Mono";
	  style = "Italic";
	};
	bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
	  style = "Bold Italic";
	};
      };
      colors = with config.colorScheme.colors; {
        bright = {
          black = "0x${base02}";
          blue = "0x${base0C}";
          cyan = "0x${base0A}";
          green = "0x${base0B}";
          magenta = "0x${base0D}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base09}";
        };
        cursor = {
          cursor = "0x${base07}";
          text = "0x${base06}";
        };
        normal = {
          black = "0x${base02}";
          blue = "0x${base0C}";
          cyan = "0x${base0A}";
          green = "0x${base0B}";
          magenta = "0x${base0D}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base09}";
        };
        primary = {
          background = "0x${base00}";
          foreground = "0x${base06}";
        };
      };
      key_bindings = [
        {
	  key = "Return";
	  mods = "Super|Shift";
	  action = "SpawnNewInstance";
	}
      ];
    };
  };
}
