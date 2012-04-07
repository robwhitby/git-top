#!/bin/sh
BASEDIR=$(dirname $0)

if [ $# -lt 1 ]
then
  echo "Usage: git-top.sh [core aim ml etc]"
  exit 65
fi

names='alex|alinoor|andreas|charles|chris|chrism|christine|duncan|hector|john|jose|karl|ken|liz|marc|mark|markp|michael|minal|mushtaq|pat|rob|ron|sebastian|steffen|suzuki|tom|uday|veda|volker'


gitroot=/home/casper/casper


for dir in $*
do 

echo $dir
cd $gitroot/$dir
git pull --rebase > /dev/null 2>&1
git log --format=%s |
tr '[A-Z]' '[a-z]' |
sed -E 's/^([a-z]*)[^a-z]{1,2}([a-z]*)[^a-z]{1,2}([a-z]*).*/\1\
\2\
\3/' |
sed 's/hoff/marc/' |
sed 's/chrim/chrism/' |
sed 's/chrisj/chris/' |
sed 's/adnreas/andreas/' |
sed 's/rw/rob/' |
sed 's/kebn/ken/' |
sed -E 's/chalres|chales/charles/'|
sed -E 's/dancun|ducan/duncan/' |
sed -E 's/joze|jsoe/jose/' |
sed -E 's/mike|micheal/michael/' |
grep -xE $names |
sort |
uniq -c |
sort -bnr

done

cd $BASEDIR
