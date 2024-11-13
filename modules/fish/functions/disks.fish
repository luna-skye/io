function disks -d "Prints useful information about disk devices"
  set blks (lsblk -o type,name,model,fstype,log-sec,phy-sec,mountpoint,size,fsused,fsavail)
  for blk in $blks
    if string match -q "TYPE *" "$blk"
      set_color grey -b black
    else if string match -q "disk *" "$blk"
      set_color grey -b black
      echo ""
    else
      set_color magenta -b normal
    end

    echo "  $blk  "
  end
end
