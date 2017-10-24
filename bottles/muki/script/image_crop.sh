#!/bin/sh

# 273 or 272
# 960 - 270
# 690
# 690x1080+270+0
# convert img_004.JPG  -crop 2x1@ +repage +adjoin 'out/out_004_%d.jpg'

# convert img_[002-094].JPG  -crop 2x1@ +repage +adjoin 'out/out_img_004_%d.jpg'

for i in $(seq -w 2 94)
do
    echo "img_0${i}.JPG"
    convert  "img_0${i}.JPG" -crop 2x1@ +repage +adjoin "out/img_0${i}_%d.JPG"
    convert "out/img_0${i}_0.JPG" -crop 690x1080+265+0 "out/crop_img_0${i}_0_left.JPG"
    convert "out/img_0${i}_1.JPG" -crop 695x1080+0+0 "out/crop_img_0${i}_1_right.JPG"
    rm "out/img_0${i}_0.JPG"
    rm "out/img_0${i}_1.JPG"
    mv "out/crop_img_0${i}_1_right.JPG" "out/img_0${i}_0_right.JPG"
    mv "out/crop_img_0${i}_0_left.JPG" "out/img_0${i}_1_left.JPG"
done
