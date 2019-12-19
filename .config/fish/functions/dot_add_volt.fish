function dot_add_volt
  for f in plugconf/(volt list | sed -r 's/^[ \t]+//g; 1,2d').vim
    dot add $VOLTPATH/$f
  end
end
