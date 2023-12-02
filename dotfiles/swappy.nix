{ pkgs, config, ... } : 

{
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir = $HOME/Pictures/Screenshots
    save_filename_format = Screenshot-%Y-%m-%d_%H-%m-%S.png
    show_panel=true
    line_size=5
    text_size=20
    text_font=sans-serif
    paint_mode=brush
    early_exit=false;
    fill_shape=false;
  '';
}
