# /bin/sh/fish

function disks -d "Prints useful information about disk devices"
  set blks (lsblk -o name,label,model,fstype,size,fsused,fsavail)
  for blk in $blks
    echo $blk
  end
end
