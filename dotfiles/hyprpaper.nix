{ pkgs, config, ... } : 

let
  left = "/home/angelo/configs/dotfiles/assets/wallpapers/left.png";
  right = "/home/angelo/configs/dotfiles/assets/wallpapers/right.png";
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${left}
    preload = ${right}

    wallpaper = HDMI-A-1, ${left}
    wallpaper = DP-3, ${right}
  '';
}
