{ pkgs, ... }:

{
  home.packages = with pkgs; [
    exiftool
    xdg-utils
    ripdrag
    zip
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        layout = [ 1 3 3 ];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "size";
        show_hidden = false;
        show_symlink = true;
      };
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
      };
      plugins = {
        preload = [
          "~/.config/yazi/ui.lua"
          "~/.config/yazi/status-name-function.lua"
        ];
      };
      opener = {
        edit = [
          {
            exec = ''nvim "$@"'';
            block = true;
            desc = "neovim";
          }
          {
            exec = ''codium "$@"'';
            block = false;
            orphan = true;
            desc = "vscodium";
          }
        ];

        open = [
          {
            exec = ''xdg-open "''$@"'';
            desc = "Open";
            orphan = true;
          }
        ];
        reveal = [
          {
            exec = ''exiftool "''$1"; echo "Press enter to exit"; read'';
            block = true;
            desc = "Show EXIF";
          }
        ];
        extract = [
          {
            exec = ''unar -d "''$1"'';
            desc = "Extract here";
          }
        ];
        play = [
          {
            exec = ''mpv "''$@"'';
            orphan = true;
          }
          {
            exec = ''mediainfo "''$1"; echo "Press enter to exit"; read'';
            block = true;
            desc = "Show media info";
          }
        ];
      };
      open = {
        rules = [
          { name = "*/"; use = [ "edit" "open" "reveal" ]; }

          { mime = "text/*"; use = [ "edit" "reveal" ]; }
          { mime = "image/*"; use = [ "open" "reveal" ]; }
          { mime = "video/*"; use = [ "play" "reveal" ]; }
          { mime = "audio/*"; use = [ "play" "reveal" ]; }
          { mime = "inode/x-empty"; use = [ "edit" "reveal" ]; }

          { mime = "application/json"; use = [ "edit" "reveal" ]; }
          { mime = "*/javascript"; use = [ "edit" "reveal" ]; }

          { mime = "application/zip"; use = [ "extract" "reveal" ]; }
          { mime = "application/gzip"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-tar"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-bzip"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-bzip2"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-7z-compressed"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-rar"; use = [ "extract" "reveal" ]; }
					{ mime = "application/x-xz"; use = [ "extract" "reveal" ]; }

          { mime = "*"; use = [ "open" "reveal" ]; }
        ];
      };
      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
        image_alloc = 536870912;
        image_bound = [ 0 0 ];
      };
      input = {
        cd_title = "Change directory:";
        cd_origin = "top-center";
        cd_offset = [ 0 2 50 3 ];

        create_title = "Create:";
        create_origin = "top-center";
        create_offset = [ 0 2 50 3 ];

        rename_title = "Rename:";
        rename_origin = "hovered";
        rename_offset = [ 0 1 50 3 ];

        trash_title = "Move {n} selected file{s} to trash? (y/N)";
        trash_origin = "top-center";
        trash_offset = [ 0 2 50 3 ];

        delete_title = "Delete {n} selected file{s} permanently? (y/N)";
        delete_origin = "top-center";
        delete_offset = [ 0 2 50 3 ];

        find_title = [ "Find next:" "Find previous:" ];
        find_origin = "top-center";
        find_offset = [ 0 2 50 3 ];

        search_title = "Search:";
        search_origin = "top-center";
        search_offset = [ 0 2 50 3 ];

        shell_title = [ "Shell:" "Shell (block):" ];
        shell_origin = "top-center";
        shell_offset = [ 0 2 50 3 ];

        overwrite_title = "Overwrite an existing file? (y/N)";
        overwrite_origin = "top-center";
        overwrite_offset = [ 0 2 50 3 ];

        quit_title = "{n} task{s} running, sure to quit? (y/N)";
        quit_origin = "top-center";
        quit_offset = [ 0 2 50 3 ];
      };
      select = {
        open_title = "Open with:";
        open_origin = "hovered";
        open_offset = [ 0 1 50 7 ];
      };
      log = {
        enabled = true;
      };
    };
    keymap = {
      manager.keymap = [
        { on = [ "<Enter>" "d" ]; exec = ''shell 'ripdrag -an "''$@"' --confirm''; desc = "Drag & Drop"; }

        { on = [ "<Esc>" ]; exec = "escape --all"; desc = "Cancel input"; }
        { on = [ "<C-Q>" ]; exec = "quit --no-cwd-file"; desc = "Quit the process without writing cwd-file"; }
        { on = [ "<C-q>" ]; exec = "quit"; desc = "Quit"; }

        { on = [ "<S-Up>" ]; exec = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "<S-Down>" ]; exec = "arrow 5"; desc = "Move cursor down 5 lines"; }
        { on = [ "<PageUp>" ]; exec = "arrow -100%"; desc = "Move cursor up one page"; }
        { on = [ "<PageDown>" ]; exec = "arrow 100%"; desc = "Move cursor down one page"; }
        { on = [ "<C-Up>" ]; exec = "peek -5"; desc = "Peek up 5 units in the preview"; }
        { on = [ "<C-Down>" ]; exec = "peek 5"; desc = "Peek down 5 units in the preview"; }
        { on = [ "<Up>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ]; exec = "arrow 1"; desc = "Move cursor down"; }
        { on = [ "<Left>" ]; exec = "leave"; desc = "Go back to the parent directory"; }
        { on = [ "<Right>" ]; exec = "enter"; desc = "Enter the child directory"; }
        { on = [ "g" "g" ]; exec = "arrow -99999999"; desc = "Move cursor to the top"; }
        { on = [ "G" ]; exec = "arrow 99999999"; desc = "Move cursor to the bottom"; }

        { on = [ "<Space>" ]; exec = [ "select --state=none" "arrow 1" ]; desc = "Toggle the current selection state"; }
        { on = [ "<C-a>" ]; exec = "select_all --state=true"; desc = "Select all files"; }
        { on = [ "<C-r>" ]; exec = "select_all --state=none"; desc = "Inverse selection of all files"; }

        { on = [ "<Enter>" "o" ]; exec = "open --interactive"; desc = "Open with"; }
        { on = [ "<Enter>" "<Enter>" ]; exec = "open"; desc = "Action"; }
        { on = [ "<Enter>" "<Right>" ]; exec = "enter"; desc = "Enter"; }
        { on = [ "<C-c>" ]; exec = [ "yank" "escape --visual --select" ]; desc = "Copy the selected files"; }
        { on = [ "<C-x>" ]; exec = [ "yank --cut" "escape --visual --select" ]; desc = "Cut the selected files"; }
        { on = [ "<C-v>" ]; exec = "paste"; desc = "Paste the files"; }
        { on = [ "<Delete>" ]; exec = [ "remove" "escape --visual --select" ]; desc = "Move the files to the trash"; }
        { on = [ "<C-Delete>" ]; exec = [ "remove --permanently" "escape --visual --select" ]; desc = "Permanently delete the files"; }
        { on = [ "o" "n" ]; exec = "create"; desc = "New"; }
        { on = [ "<Enter>" "r" ]; exec = "rename"; desc = "Rename a file or directory"; }
        { on = [ "o" "s" ]; exec = "shell"; desc = "Shell"; }
        { on = [ "o" "S" ]; exec = "shell --block"; desc = "Shell; Blocking"; }
        { on = [ "o" "h" ]; exec = "hidden toggle"; desc = "Show hidden"; }
        { on = [ "<C-f>" "n" ]; exec = "search fd"; desc = "Search by name"; }
        { on = [ "<C-f>" "c" ]; exec = "search rg"; desc = "Search by content"; }
        { on = [ "<C-s>" ]; exec = "search none"; desc = "Cancel the ongoing search"; }
        { on = [ "<C-f>" "z" ]; exec = "jump fzf"; desc = "Fuzzy finder"; }

        { on = [ "<Enter>" "c" ]; exec = "copy path"; desc = "Copy path"; }
        { on = [ "<Enter>" "f" ]; exec = "copy filename"; desc = "Copy name"; }

        { on = [ "<Enter>" "z" ]; exec = '' shell 'printf "File Name:"; read name; zip "''$name.zip" "''$@"' --block --confirm''; desc = "ZIP file"; }

        { on = [ "/" ]; exec = "find --smart"; }
        { on = [ "?" ]; exec = "find --previous --smart"; }
        { on = [ "n" ]; exec = "find_arrow"; }
        { on = [ "N" ]; exec = "find_arrow --previous"; }

        { on = [ "s" "m" ]; exec = "sort modified --dir_first"; desc = "Sort by modified time"; }
        { on = [ "s" "M" ]; exec = "sort modified --reverse --dir_first"; desc = "Sort by modified time (reverse)"; }
        { on = [ "s" "c" ]; exec = "sort created --dir_first"; desc = "Sort by created time"; }
        { on = [ "s" "C" ]; exec = "sort created --reverse --dir_first"; desc = "Sort by created time (reverse)"; }
        { on = [ "s" "e" ]; exec = "sort extension --dir_first"; desc = "Sort by extension"; }
        { on = [ "s" "E" ]; exec = "sort extension --reverse --dir_first"; desc = "Sort by extension (reverse)"; }
        { on = [ "s" "a" ]; exec = "sort alphabetical --dir_first"; desc = "Sort alphabetically"; }
        { on = [ "s" "A" ]; exec = "sort alphabetical --reverse --dir_first"; desc = "Sort alphabetically (reverse)"; }
        { on = [ "s" "n" ]; exec = "sort natural --dir_first"; desc = "Sort naturally"; }
        { on = [ "s" "N" ]; exec = "sort natural --reverse --dir_first"; desc = "Sort naturally (reverse)"; }
        { on = [ "s" "s" ]; exec = "sort size --dir_first"; desc = "Sort by size"; }
        { on = [ "s" "S" ]; exec = "sort size --reverse --dir_first"; desc = "Sort by size (reverse)"; }

        { on = [ "w" ]; exec = "tasks_show"; desc = "Show the tasks manager"; }

        { on = [ "g" "h" ]; exec = "cd ~"; desc = "Go to the home directory"; }
        { on = [ "g" "c" ]; exec = "cd ~/.config"; desc = "Go to the config directory"; }
        { on = [ "g" "d" ]; exec = "cd ~/Downloads"; desc = "Go to the downloads directory"; }
        { on = [ "g" "t" ]; exec = "cd /tmp"; desc = "Go to the temporary directory"; }
        { on = [ "g" "<Space>" ]; exec = "cd --interactive"; desc = "Go to a directory interactively"; }

        { on = [ "~" ]; exec = "help"; desc = "Open help"; }
      ];

      tasks.keymap = [
        { on = [ "<Esc>" ]; exec = "close"; desc = "Hide the task manager"; }
        { on = [ "<C-q>" ]; exec = "close"; desc = "Hide the task manager"; }
        { on = [ "w" ]; exec = "close"; desc = "Hide the task manager"; }

        { on = [ "k" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "j" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "<Up>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "<Enter>" ]; exec = "inspect"; desc = "Inspect the task"; }
        { on = [ "x" ]; exec = "cancel"; desc = "Cancel the task"; }

        { on = [ "~" ]; exec = "help"; desc = "Open help"; }
      ];

      select.keymap = [
        { on = [ "<C-q>" ]; exec = "close"; desc = "Cancel selection"; }
        { on = [ "<Esc>" ]; exec = "close"; desc = "Cancel selection"; }
        { on = [ "<Enter>" ]; exec = "close --submit"; desc = "Submit the selection"; }

        { on = [ "<Up>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "<S-Up>" ]; exec = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "<S-Down>" ]; exec = "arrow 5"; desc = "Move cursor down 5 lines"; }

        { on = [ "~" ]; exec = "help"; desc = "Open help"; }
      ];

      input.keymap = [
        { on = [ "<C-q>" ]; exec = "close"; desc = "Cancel input"; }
        { on = [ "<Enter>" ]; exec = "close --submit"; desc = "Submit the input"; }
        { on = [ "<Esc>" ]; exec = "close"; desc = "Go back the normal mode, or cancel input"; }

        { on = [ "<Left>" ]; exec = "move -1"; desc = "Move back a character"; }
        { on = [ "<Right>" ]; exec = "move 1"; desc = "Move forward a character"; }

        { on = [ "<C-Left>" ]; exec = "backward"; desc = "Move back to the start of the current or previous word"; }
        { on = [ "<C-Right>" ]; exec = "forward --end-of-word"; desc = "Move forward to the end of the current or next word"; }

        { on = [ "<Home>" ]; exec = "move -999"; desc = "Move to the BOL"; }
        { on = [ "<End>" ]; exec = "move 999"; desc = "Move to the EOL"; }

        { on = [ "<Backspace>" ]; exec = "backspace"; desc = "Delete the character before the cursor"; }
        { on = [ "<C-h>" ]; exec = "backspace"; desc = "Delete the character before the cursor"; }
        { on = [ "<C-d>" ]; exec = "backspace --under"; desc = "Delete the character under the cursor"; }

        { on = [ "<C-Backspace>" ]; exec = "kill backward"; desc = "Kill backwards to the start of the current word"; }
        { on = [ "<C-Delete>" ]; exec = "kill forward"; desc = "Kill forwards to the end of the current word"; }

        { on = [ "<C-x>" ]; exec = "delete --cut"; desc = "Cut the selected characters"; }
        { on = [ "<C-c>" ]; exec = "yank"; desc = "Copy the selected characters"; }
        { on = [ "<C-v>" ]; exec = "paste"; desc = "Paste the copied characters after the cursor"; }

        { on = [ "<C-z>" ]; exec = "undo"; desc = "Undo the last operation"; }
        { on = [ "<C-r>" ]; exec = "redo"; desc = "Redo the last operation"; }

        { on = [ "~" ]; exec = "help"; desc = "Open help"; }
      ];

      completion.keymap = [
        { on = [ "<C-q>" ]; exec = "close"; desc = "Cancel completion"; }
        { on = [ "<Tab>" ]; exec = "close --submit"; desc = "Submit the completion"; }

        { on = [ "<A-k>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<A-j>" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "<Up>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "~" ]; exec = "help"; desc = "Open help"; }
      ];
      help.keymap = [
        { on = [ "<Esc>" ]; exec = "escape"; desc = "Clear the filter, or hide the help"; }
        { on = [ "q" ]; exec = "close"; desc = "Exit the process"; }
        { on = [ "<C-q>" ]; exec = "close"; desc = "Hide the help"; }

        { on = [ "k" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "j" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "K" ]; exec = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "J" ]; exec = "arrow 5"; desc = "Move cursor down 5 lines"; }

        { on = [ "<Up>" ]; exec = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ]; exec = "arrow 1"; desc = "Move cursor down"; }

        { on = [ "<S-Up>" ]; exec = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "<S-Down>" ]; exec = "arrow 5"; desc = "Move cursor down 5 lines"; }

        { on = [ "/" ]; exec = "filter"; desc = "Apply a filter for the help items"; }
      ];
    };
    theme = {
      manager = {
        folder_offset = [ 2 0 2 0 ];
        preview_offset = [ 2 1 2 1 ];
      };
    };
  };
  xdg.configFile."yazi/ui.lua".text = ''
    		function Manager:render(area)
    			local chunks = ui.Layout()
    				:direction(ui.Direction.HORIZONTAL)
    				:constraints({
    					ui.Constraint.Ratio(MANAGER.layout.parent, MANAGER.layout.all),
    					ui.Constraint.Ratio(MANAGER.layout.current, MANAGER.layout.all),
    					ui.Constraint.Ratio(MANAGER.layout.preview, MANAGER.layout.all),
    				})
    				:split(area)

    				local bar = function(c, x, y)
    					return ui.Bar(
    						ui.Rect { x = math.max(0, x), y = math.max(0, y), w = math.min(1, area.w), h = math.min(1, area.h) },
    						ui.Position.TOP
    					):symbol(c)
    				end

    			return utils.flat {
    			-- Borders
    			ui.Border(area, ui.Position.ALL):type(ui.Border.ROUNDED),
    			ui.Bar(chunks[1], ui.Position.RIGHT),
    			ui.Bar(chunks[3], ui.Position.LEFT),

    			bar("┬", chunks[1].right - 1, chunks[1].y),
    			bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
    			bar("┬", chunks[2].right, chunks[2].y),
    			bar("┴", chunks[2].right, chunks[1].bottom - 1),

    			-- Parent
    			Folder:render(chunks[1]:padding(ui.Padding.xy(1)), { kind = Folder.PARENT }),
    			-- Current
    			Folder:render(chunks[2]:padding(ui.Padding.y(1)), { kind = Folder.CURRENT }),
    			-- Preview
    			ui.Base(chunks[3]:padding(ui.Padding.xy(1)), ui.Base.PREVIEW),
    			}
    		end
    	'';
  xdg.configFile."yazi/status-name-function.lua".text = ''
    	  function Status:name()
    			local h = cx.active.current.hovered
    			if h == nil then
    				return ui.Span("")
    			end
    			
    			local linked = ""
    			if h.link_to ~= nil then
    				linked = " -> " .. tostring(h.link_to)
    			end
    			return ui.Span(" " .. h.name .. linked)
    		end
    	'';
}
