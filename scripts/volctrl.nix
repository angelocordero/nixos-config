{ pkgs } : 

pkgs.writeShellApplication {
  name = "volctrl";

  runtimeInputs = with pkgs; [ hyprland procps kitty pulsemixer jq ];

  text = ''
    clients=$(hyprctl clients -j)

    if grep -q '"title": "volctrl"' <<< "$clients"; then
      volctrl_id=$(echo "$clients" | jq -r '.[] | select(.title == "volctrl").pid')
      kill "$volctrl_id"
    else
      kitty -T volctrl -e pulsemixer
    fi
  '';
}
  

