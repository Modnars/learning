#!/bin/bash

git pull --rebase --autostash  # pull the latest contents
git add .
status=`git status -s`
status=${status:0:1}
echo "git status: ${status}"
if [[ $status = "M" || $status = "A" || $status = "D" || $status = "R" ]]; then
    echo "contents changed, committing..."
    branch=`git symbolic-ref --short HEAD`
    git commit -m "auto commit by deploy.sh from branch:${branch} @ `date`"
    git push
fi

rm -fr ./_output/

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
rm -fr ./docs/
mv _output/ docs/
git add ./docs/
status=`git status -s`
status=${status:0:1}
echo "git status: $status"
if [[ $status = "M" || $status = "A" || $status = "D" || $status = "R" ]]; then
    echo "contents changed, committing..."
    branch=`git symbolic-ref --short HEAD`
    git commit -m "auto commit by deploy.sh from branch:${branch} @ `date`"
    git push
fi
git checkout main

exit

# git checkout gh-pages
# mv _output docs
# git add -f docs
# git commit -m "auto commit @ `date`"
# git push origin gh-pages
# git co main
# mv docs _output

