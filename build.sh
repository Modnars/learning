#!/usr/bin/env sh

for dir in ./[^_]*
do
    if test -d $dir
    then
        echo Processing $dir ...
        cd $dir
        sphinx-build . ../_output/$dir
        cd -
        echo Processing $dir done.
    fi
done

git checkout gh-pages
mv _output docs
git add -f docs
git commit -m "auto commit @ `date`"
git push origin gh-pages
git co main
mv docs _output

