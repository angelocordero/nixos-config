{ pkgs, ... }:

{
  home.packages = [
    pkgs.swww
  ];

  home.sessionVariables = {
    SWWW_TRANSITION_STEP = 255;
  };
}
