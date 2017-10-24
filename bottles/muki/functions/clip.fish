
function clip-fetch
xclip -o | xargs fetch
end

function clip-base
xclip -o | xargs basename
end

function clip-mkdir
clip-base | xargs mkdir -v -p
end

function clip-mpv
 mpv (clip)
end

function clip-4chan
xclip -o | xargs dirname | xargs basename
end

function clip
xclip -o
end
