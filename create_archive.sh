#!/bin/sh

PROJECT=ptex-base
TMP=/tmp

git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)

# Remove auxiliary files
rm $TMP/$PROJECT/.gitignore
rm $TMP/$PROJECT/create_archive.sh

echo " * Create $PROJECT.zip"

PWDF=`pwd`
cd $TMP && zip -r $PWDF/$PROJECT.zip $PROJECT
rm -rf $TMP/$PROJECT
echo
echo " * Done: $PROJECT.zip"
