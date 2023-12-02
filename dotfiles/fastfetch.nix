{ pkgs, config, ... } : 

{
  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "modules": [
        "title",
        "separator",
	{
	  "type": "os",
	  "format": "{} {}"
	},
        "host",
        "kernel",
        "uptime",
        "packages",
	{
          "type": "shell",
	  "format": "{}"
	},
        {
	 "type": "terminal",
	 "format": "{}"
	},
	{
          "type": "wm",
	  "format": "{}"
	},
	{
	  "type": "cpu",
	  "format": "{}"
	},
        {
	  "type": "gpu",
          "forceVulkan": true,
	  "format": "{2}"
	},
        "memory",
	{
	"type": "disk",
        "format": "{} / {} ({})"
	},
        "break",
        "colors"
      ]
    }
  '';
}
