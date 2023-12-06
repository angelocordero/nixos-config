{ pkgs }:

pkgs.writeShellApplication {
  name = "my-screenshot-region-edit";

  runtimeInputs = with pkgs; [ grim slurp imagemagick swappy ];

  text = ''
    grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | swappy -f -
  '';
}


