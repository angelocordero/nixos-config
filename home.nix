{ config, pkgs, inputs, ... }:

{
  imports = with inputs; [
    nix-colors.homeManagerModules.default
    hyprland.homeManagerModules.default
  ] ++ [
    #./dotfiles/alacritty.nix
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
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

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

  # Git
  programs.git = {
    enable = true;
    userName = "angelocordero";
    userEmail = "johnangelocordero.dev@gmail.com";
    extraConfig = {
      core = {
        branch = "main";
      };
    };
  };

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
    monitor = HDMI-A-1, 1920x1080@60, 0x0, 1
    monitor = DP-3, 1920x1080@75, 1920x0, 1

    exec-once = swww init
    exec-once = swaync
    exec-once = waybar
    exec-once = /home/angelo/.local/share/hyprload/hyprload.sh

		exec = swww img -o HDMI-A-1 "$HOME/configs/dotfiles/assets/wallpapers/left.png"
		exec = swww img -o DP-3 "$HOME/configs/dotfiles/assets/wallpapers/right.png"

    general {
      gaps_out = 10
      col.active_border = rgba(${config.colorScheme.colors.base0B}ff) rgba(${config.colorScheme.colors.base0D}ff) 45deg
      col.inactive_border= 0xff${config.colorScheme.colors.base03}
      border_size = 3
    }

    decoration {
      rounding = 5
    }

    plugin {
      split-monitor-workspaces {
        count = 5
      }
    }

    windowrulev2 = float, title:(volctrl)
    windowrulev2 = pin, title:(volctrl)
    windowrulev2 = size 900 400, title:(volctrl)
    windowrulev2 = move 65 650, title:(volctrl)

    bind = SUPER, RETURN, exec, kitty -1
    bind = SUPER, D, exec, wofi --show drun

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
    '';
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    (import ./scripts/my-screenshot.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-monitor.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-region.nix { inherit pkgs; })
    (import ./scripts/my-screenshot-region-edit.nix { inherit pkgs; })
    (import ./scripts/hyprland-scripts.nix { inherit pkgs; })
    (import ./scripts/volctrl.nix { inherit pkgs; })
		(import ./scripts/wallpaper-script.nix { inherit pkgs; })

		pkgs.swww
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/angelo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
