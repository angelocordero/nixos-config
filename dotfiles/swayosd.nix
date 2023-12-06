{ config, pkgs, ... }:

{
  home.packages = [ pkgs.swayosd ];

  home.file.".config/swayosd/style.css".text = ''
    window {
      padding: 12px 20px;
      border-radius: 5px;
      border: 1px solid #${config.colorScheme.colors.base0B};
      background: #${config.colorScheme.colors.base02};
    }

    #container {
      margin: 16px;
    }

    image, label {
      color: #${config.colorScheme.colors.base06};
    }

    progressbar:disabled,
    image:disabled {
      opacity: 0.5;
    }

    progressbar {
      min-height: 6px;
      border-radius: 999px;
      background: transparent;
      border: none;
    }

    trough {
      min-height: inherit;
      border-radius: inherit;
      border: none;
      background: #${config.colorScheme.colors.base0D};
    }

    progress {
      min-height: inherit;
      border-radius: inherit;
      border: none;
      background: #${config.colorScheme.colors.base0D};
    }
  '';
}
