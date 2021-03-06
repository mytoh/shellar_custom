#!/bin/sh

main() {
    local in  out bitrate quality qmin qmax
    in="${1}"
      out="${in%.*}.webm" # remove extension
      bitrate="1500k"
      quality="best"
      qmin=0
      qmax=50
      acodec="libopus"
      vcodec="libvpx"
      vf="colormatrix=bt709:bt601" # video filter
      strict="-strict -2"
      echo "convert start"
      ffmpeg -i "${in}" ${strict} -vcodec ${vcodec} \
             -qmin ${qmin} -qmax ${qmax} \
             -quality ${quality} -crf 5 \
             -vf ${vf} -sn \
             -b:v ${bitrate} -acodec ${acodec} \
             "${out}"
      echo "${out}"
      echo "convert finish"
}

main "${1}"
