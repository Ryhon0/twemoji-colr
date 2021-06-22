echo Make sure to run setup.sh

echo Processing custom emojis
for f in custom/*
do
	f=$(echo $(basename $f) | cut -f 1 -d '.')
	echo Copying $f
	cp custom/$f.png 72x72/
	
	echo Creating empty $f.svg file
	dir=$(ls -d twemoji-*.*.*)
	touch $dir/assets/svg/$f.svg
done


echo Building...
mv twe-svg.zip twe-svg.zip.old; zip -rj twe-svg.zip twemoji-*/assets/svg
node layerize.js twe-svg.zip overrides extras build twemoji-sbix && ttx -o build/twemoji-sbix.ttf build/twemoji-sbix.ttx
