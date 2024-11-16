function yy -d "Opens a Yazi file explorer which will persist CWD on exit"
  set tmp (mktemp -t "yazi-cwd.XXXXXX")
  yazi $argv --cwd-file="$tmp"
  if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    cd "$cwd"
  end
  rm -f -- "$tmp"
end
