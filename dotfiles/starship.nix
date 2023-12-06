{ pkgs, config, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      line_break = false;
      format = "$directory$branch$commit$character";
      right_format = "$cmd_duration";
      continuation_prompt = "󱞩 ";
      cmd_duration = {
        format = "took [$duration]($style)";
      };
      character = {
        success_symbol = "[󰁔](blue)";
        error_symbol = "[](cyan)";
      };
      git_branch = {
        format = " $branch";
      };
      git_commit = {
        commit_hash_length = 8;
      };
    };
  };
}
