{ pkgs } : 

pkgs.writeShellApplication {
  name = "volctrl";

  runtimeInputs = with pkgs; [ hyprland procps alacritty pulsemixer jq ];

  text = ''
    clients =$(hyprctl clients -j)

    if grep -q '"title": "volctrl"' <<< "$json_data"; then
      volctrl_id=$(jq -r '.[] | select(.title == "volctrl") | .id' <<< "$json_data")
      kill $volctrl_id
    else
      alacritty -T volctrl -e pulsemixer
    fi
  '';
}
  

