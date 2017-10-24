#!/bin/sh
# Modified: Fang lungang 03/13/2010 21:55>
# http://www.emacswiki.org/emacs/EMMS
for afile in "$@"; do
    path=$(dirname "$afile")
    gm convert -resize 60x60 "$afile" "$path/cover_small.png"
    gm convert -resize 120x120 "$afile" "$path/cover_med.png"
    # large cover not used
done
