{ pkgs } : 

pkgs.writeShellApplication {
	name = "set-wallpaper";

	runtimeInputs = with pkgs; [ imagemagick hyprland ];
  
	text = ''
	  image_path="$1"

		# Check if the image path is provided
		if [ -z "$image_path" ]; then
  		echo "Error: Please provide the image path as a command line argument."
  		echo "Usage: $0 <image_path>"
  		exit 1
		fi

		# Check if the image file exists
		if [ ! -f "$image_path" ]; then
  		echo "Error: Image file '$image_path' does not exist."
  		exit 1
		fi

		wallpapers_folder="$HOME/configs/dotfiles/assets/wallpapers"

		convert "$image_path" -gravity East -crop 50%x100%+0+0 "''${wallpapers_folder}/right.png"
		convert "$image_path" -gravity West -crop 50%x100%+0+0 "''${wallpapers_folder}/left.png"

		hyprctl reload

		echo "Success"
	'';
}
