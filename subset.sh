#!/bin/bash

mkdir -p ./output/100
mkdir -p ./output/300
mkdir -p ./output/700
mkdir -p ./output/900

grep "/* unicode-range" ./node_modules/@fontsource/noto-sans-jp/300.css | sed -e "s/  unicode-range: //" | split -a 1 -d -l 1 - unicode-range-
grep "/* unicode-range" ./node_modules/@fontsource/noto-sans-jp/300.css | sed -e "s/  unicode-range: //" | split -a 2 -d -l 1 - unicode-range-
grep "/* unicode-range" ./node_modules/@fontsource/noto-sans-jp/300.css | sed -e "s/  unicode-range: //" | split -a 3 -d -l 1 - unicode-range-

for i in {0..9}
do
    rm unicode-range-0$i*
    rm unicode-range-00$i
done

for i in {0..119}
do
    pyftsubset ./LINESeed/LINESeedJP_OTF_Th.woff2 --unicodes-file=./unicode-range-$i --ignore-missing-glyphs --flavor=woff2 --output-file=./output/100/LINESeedJP-$i-100-normal.woff2
    pyftsubset ./LINESeed/LINESeedJP_OTF_Rg.woff2 --unicodes-file=./unicode-range-$i --ignore-missing-glyphs --flavor=woff2 --output-file=./output/300/LINESeedJP-$i-300-normal.woff2
    pyftsubset ./LINESeed/LINESeedJP_OTF_Bd.woff2 --unicodes-file=./unicode-range-$i --ignore-missing-glyphs --flavor=woff2 --output-file=./output/700/LINESeedJP-$i-700-normal.woff2
    pyftsubset ./LINESeed/LINESeedJP_OTF_Eb.woff2 --unicodes-file=./unicode-range-$i --ignore-missing-glyphs --flavor=woff2 --output-file=./output/900/LINESeedJP-$i-900-normal.woff2
done

cat ./node_modules/@fontsource/noto-sans-jp/100.css | sed -e "s/, url('.\/files\/noto-sans-jp-all-100-normal.woff') format('woff')//" | sed -e "s/.\/files\/noto-sans-jp/.\/100\/LINESeedJP/" | sed -e "s/Noto Sans JP/LINE Seed JP/" > ./output/100.css
cat ./node_modules/@fontsource/noto-sans-jp/300.css | sed -e "s/, url('.\/files\/noto-sans-jp-all-300-normal.woff') format('woff')//" | sed -e "s/.\/files\/noto-sans-jp/.\/300\/LINESeedJP/"  | sed -e "s/Noto Sans JP/LINE Seed JP/" > ./output/300.css
cat ./node_modules/@fontsource/noto-sans-jp/700.css | sed -e "s/, url('.\/files\/noto-sans-jp-all-700-normal.woff') format('woff')//" | sed -e "s/.\/files\/noto-sans-jp/.\/700\/LINESeedJP/" | sed -e "s/Noto Sans JP/LINE Seed JP/" > ./output/700.css
cat ./node_modules/@fontsource/noto-sans-jp/900.css | sed -e "s/, url('.\/files\/noto-sans-jp-all-900-normal.woff') format('woff')//" | sed -e "s/.\/files\/noto-sans-jp/.\/900\/LINESeedJP/" | sed -e "s/Noto Sans JP/LINE Seed JP/" > ./output/900.css

rm unicode-range-*