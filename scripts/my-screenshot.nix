{ pkgs } :

pkgs.writeShellApplication {
  name = "my-screenshot";

  runtimeInputs = with pkgs; [ grim wl-clipboard libnotify ];

  text = ''
    IMG="$HOME/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

    grim "$IMG" && wl-copy -t image/png < "$IMG" && notify-send "Screenshots" "Screenshot copied to clipboard and saved to $IMG"
  '';
}
