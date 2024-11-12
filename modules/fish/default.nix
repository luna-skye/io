{ lib, utils, pkgs, ... }: {
  programs.fish = {
    enable = lib.mkDefault true;

    shellAbbrs = {
      h = lib.mkDefault "history";
      x = lib.mkDefault "exit";
      c = lib.mkDefault "clear";
      lns = lib.mkDefault "ln -s";
      mkdirp = lib.mkDefault "mkdir -p";
      cpr = lib.mkDefault "cp -R";
      chx = lib.mkDefault "chmod +x";
      chr = lib.mkDefault "chmod -R";

      # Git
      g   = lib.mkDefault "git";
      gs  = lib.mkDefault "git status";
      ga  = lib.mkDefault "git add";
      gaa = lib.mkDefault "git add all";
      gc  = lib.mkDefault "git commit";
      gco = lib.mkDefault "git checkout";
      gp  = lib.mkDefault "git push";
      gpl = lib.mkDefault "git pull";
      gcl = lib.mkDefault "git clone";
      gf  = lib.mkDefault "git fetch";
      gr  = lib.mkDefault "git remote";
      grb = lib.mkDefault "git rebase";
      gb  = lib.mkDefault "git branch";
      gd  = lib.mkDefault "git diff";
      gl  = lib.mkDefault "git log";

      # Tmux
      t  = lib.mkDefault "tmux";
      tl = lib.mkDefault "tmux ls";
      ta = lib.mkDefault "tmux attach -t";
      tk = lib.mkDefault "tmux kill-session -t";
    };
  };
}
