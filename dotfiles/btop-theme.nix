{ config, ... }:

{
  home.file.".config/btop/themes/my-theme.theme".text = ''
    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme[main_bg]="#${config.colorScheme.colors.base00}"
    # Base
    
    # Main text color
    theme[main_fg]="#${config.colorScheme.colors.base06}"
    # Text
    
    # Title color for boxes
    theme[title]="#${config.colorScheme.colors.base04}"
    # Subtle
    
    # Highlight color for keyboard shortcuts
    theme[hi_fg]="#${config.colorScheme.colors.base06}"
    # Text
    
    # Background color of selected item in processes box
    theme[selected_bg]="#${config.colorScheme.colors.base0F}"
    # HL High
    
    # Foreground color of selected item in processes box
    theme[selected_fg]="#${config.colorScheme.colors.base09}"
    # Gold
    
    # Color of inactive/disabled text
    theme[inactive_fg]="#${config.colorScheme.colors.base03}"
    # HL Med
    
    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
    theme[graph_text]="#${config.colorScheme.colors.base0C}"
    # Foam
    
    # Background color of the percentage meters
    theme[meter_bg]="#${config.colorScheme.colors.base0C}"
    # Foam
    
    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="#${config.colorScheme.colors.base0D}"
    # Iris
    
    # Cpu box outline color
    theme[cpu_box]="#${config.colorScheme.colors.base0A}"
    # Rose
    
    # Memory/disks box outline color
    theme[mem_box]="#${config.colorScheme.colors.base0B}"
    # Pine
    
    # Net up/down box outline color
    theme[net_box]="#${config.colorScheme.colors.base0D}"
    # Iris

    # Processes box outline color
    theme[proc_box]="#${config.colorScheme.colors.base08}"
    # Love
    
    # Box divider line and small boxes line color
    theme[div_line]="#${config.colorScheme.colors.base03}"
    # Muted
    
    # Temperature graph colors
    theme[temp_start]="#${config.colorScheme.colors.base0A}"
    # Rose
    theme[temp_mid]="#${config.colorScheme.colors.base09}"
    # Gold
    theme[temp_end]="#${config.colorScheme.colors.base08}"
    # Love
    
    # CPU graph colors
    theme[cpu_start]="#${config.colorScheme.colors.base09}"
    # Gold
    theme[cpu_mid]="#${config.colorScheme.colors.base0A}"
    # Rose
    theme[cpu_end]="#${config.colorScheme.colors.base08}"
    # Love
    
    # Mem/Disk free meter
    # all love
    theme[free_start]="#${config.colorScheme.colors.base08}"
    theme[free_mid]="#${config.colorScheme.colors.base08}"
    theme[free_end]="#${config.colorScheme.colors.base08}"
    
    # Mem/Disk cached meter
    # all iris
    theme[cached_start]="#${config.colorScheme.colors.base0D}"
    theme[cached_mid]="#${config.colorScheme.colors.base0D}"
    theme[cached_end]="#${config.colorScheme.colors.base0D}"
    
    # Mem/Disk available meter
    # all pine
    theme[available_start]="#${config.colorScheme.colors.base0B}"
    theme[available_mid]="#${config.colorScheme.colors.base0B}"
    theme[available_end]="#${config.colorScheme.colors.base0B}"
    
    # Mem/Disk used meter
    # all rose
    theme[used_start]="#${config.colorScheme.colors.base0A}"
    theme[used_mid]="#${config.colorScheme.colors.base0A}"
    theme[used_end]="#${config.colorScheme.colors.base0A}"
    
    # Download graph colors
    # Pine for start, foam for the rest
    theme[download_start]="#${config.colorScheme.colors.base0B}"
    theme[download_mid]="#${config.colorScheme.colors.base0C}"
    theme[download_end]="#${config.colorScheme.colors.base0C}"
    
    # Upload graph colors
    theme[upload_start]="#${config.colorScheme.colors.base0A}"
    # Rose for start
    theme[upload_mid]="#${config.colorScheme.colors.base08}"
    # Love for mid and end
    theme[upload_end]="#${config.colorScheme.colors.base08}"
    
    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="#${config.colorScheme.colors.base0B}"
    # Pine
    theme[process_mid]="#${config.colorScheme.colors.base0C}"
    # Foam for mid and end
    theme[process_end]="#${config.colorScheme.colors.base0C}"
  '';
}
