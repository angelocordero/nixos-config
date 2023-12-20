{ pkgs }:

pkgs.writeShellApplication {
  name = "my-screenshot-monitor";

  runtimeInputs = with pkgs; [ grim slurp imagemagick wl-clipboard libnotify ];

  text = ''
    IMG="$HOME/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

    grim -g "$(slurp -o)" - | convert - -shave 1x1 PNG:"$IMG" && wl-copy -t image/png < "$IMG" && notify-send "Screenshots" "Screenshot copied to clipboard and saved to $IMG"
  '';
}
