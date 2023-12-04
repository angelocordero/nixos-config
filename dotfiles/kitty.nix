{ pkgs, config, ... } :

{
	home.sessionVariables = {
		TERMINAL = "kitty";
	};
  
  programs.kitty = {
		enable = true;
		shellIntegration.enableZshIntegration = true;
		settings = {
			font_family = "JetBrainsMono Nerd Font Mono";
			bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
      scrollback_lines = -1;
      shell_integration = "enabled";

			cursor = "#${config.colorScheme.colors.base07}";
			cursor_text_color = "#${config.colorScheme.colors.base06}";
			cursor_shape = "beam";

			foreground = "#${config.colorScheme.colors.base06}";
			background = "#${config.colorScheme.colors.base00}";

			color0 = "#${config.colorScheme.colors.base02}";
			color8 = "#${config.colorScheme.colors.base02}";

			color1 = "#${config.colorScheme.colors.base08}";
			color9 = "#${config.colorScheme.colors.base08}";

			color2 = "#${config.colorScheme.colors.base0B}";
			color10 = "#${config.colorScheme.colors.base0B}";

			color3 = "#${config.colorScheme.colors.base09}";
			color11 = "#${config.colorScheme.colors.base09}";

			color4 = "#${config.colorScheme.colors.base0C}";
			color12 = "#${config.colorScheme.colors.base0C}";

			color5 = "#${config.colorScheme.colors.base0D}"; 
			color13 = "#${config.colorScheme.colors.base0D}";

			color6 = "#${config.colorScheme.colors.base0A}";
			color14 = "#${config.colorScheme.colors.base0A}";

			color7 = "#${config.colorScheme.colors.base06}";
			color15 = "#${config.colorScheme.colors.base06}";

			url_color = "#${config.colorScheme.colors.base0C}";
			show_hyperlink_targets = "no";
			underline_hyperlinks = "hover";
			url_style = "straight";
			
			window_padding_width = 10;
			tab_bar_style = "hidden";

    	confirm_os_window_close = 0;
		};
		keybindings = {
		  "ctrl+c" = "copy_or_interrupt";
			"super+shift+enter" = "new_os_window_with_cwd";
		};
	};
}
