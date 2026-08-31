{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
      ];
    };
    interactiveShellInit = ''
      if [[ -z "$TMUX" && -n "$PS1" ]]; then
        tmux attach-session 2>/dev/null || tmux new-session -s 1
      fi
    '';
  };
}
