{ inputs, ... } :

let
  spicePkgs = inputs.spicetify-nix.packages."x86_64-linux".default;
in
{
   nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
    "spotify"
  ];
  
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "rosepine";
    enabledExtensions = with spicePkgs.extensions; [
      autoSkipExplicit
      loopyLoop
      popupLyrics
      fullScreen
      listPlaylistsWithSong
      songStats
      playNext
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
    ];
  };
}


