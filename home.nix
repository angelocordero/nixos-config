{ config, pkgs, inputs, ... }:

{
  imports = [
#		inputs.hyprland.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
		inputs.android-nixpkgs.hmModule
    ./dotfiles/hyprland.nix
#   ./dotfiles/alacritty.nix
    ./dotfiles/kitty.nix
    ./dotfiles/wofi.nix
    ./dotfiles/swappy.nix
    ./dotfiles/swaync.nix
    ./dotfiles/starship.nix
    ./dotfiles/fastfetch.nix
    ./dotfiles/zsh.nix
    ./dotfiles/waybar.nix
    ./dotfiles/btop-theme.nix
    ./dotfiles/spicetify.nix
    ./dotfiles/mangohud.nix
    ./dotfiles/swayosd.nix
    ./dotfiles/neovim.nix
    ./dotfiles/sww.nix
    ./dotfiles/yazi.nix
  ];

  # Colorscheme for (almost) the entire system
  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

	gtk = {
		enable = true;
		cursorTheme = {
			package = pkgs.comixcursors.White;
			name = "ComixCursors-White";
		};
		theme = {
			package = pkgs.rose-pine-gtk-theme;
			name = "rose-pine";
		};
	};

  home.packages = with pkgs; [
		btop
		nvtop-amd
	  nixpkgs-fmt
    qimgv
    vlc
    arduino
    wev
    chromium
    firefox-devedition
    libnotify
    vscodium-fhs
    mangohud
    cliphist
    wl-clipboard
    wl-clip-persist
		eww-wayland
		discord
		obs-studio
		mpv
		ninja
  ] ++ [
    (import ./scripts/hyprland-workspace-script.nix { inherit pkgs; })
    (import ./scripts/wallpaper-script.nix { inherit pkgs; })
    (import ./scripts/my-screenshot.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-monitor.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-region.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-region-edit.nix { inherit pkgs; })
    (import ./scripts/volctrl.nix { inherit pkgs; })
  ];

	android-sdk = {
		enable = true;
		packages = sdk: with sdk; [
      build-tools-34-0-0
      cmdline-tools-latest
      emulator
      platforms-android-34
      sources-android-34
			platform-tools
    ];
	};

	nixpkgs.overlays = [
		inputs.android-nixpkgs.overlays.default
	];

  programs.git = {
    enable = true;
    userName = "angelocordero";
    userEmail = "johnangelocordero.dev@gmail.com";
    extraConfig = {
      core = {
        branch = "main";
      };
			safe = {
				directory = "*";
			};
    };
  };

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
		CHROME_EXECUTABLE = "chromium";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

	nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "angelo";
  home.homeDirectory = "/home/angelo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
