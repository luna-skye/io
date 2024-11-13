function a -d "Quickly and easily add an abbreviation to Fish"
  abbr --add $argv
end

a h="history";
a x="exit";
a c="clear";
a lns="ln -s";
a mkdirp="mkdir -p";
a cpr="cp -R";
a chx="chmod +x";
a chr="chmod -R";

# Git
a g="git";
a gs="git status";
a ga="git add";
a gaa="git add all";
a gc="git commit";
a gco="git checkout";
a gp="git push";
a gpl="git pull";
a gcl="git clone";
a gf="git fetch";
a gr="git remote";
a grb="git rebase";
a gb="git branch";
a gd= "git diff";
a gl="git log";

# Tmux
a t="tmux";
a tl="tmux ls";
a ta="tmux attach -t";
a tk="tmux kill-session -t";

functions -e a
