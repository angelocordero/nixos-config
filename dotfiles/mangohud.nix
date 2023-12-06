{ pkgs, config, ... }:

{
  home.file.".config/MangoHud/MangoHud.conf".text = ''
    gpu_stats
    gpu_temp

    cpu_stats
    cpu_temp

    fps
    frametime
  
    throttling_status

    frame_timing
 
    text_outline
  '';
}
    