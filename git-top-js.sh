#!/bin/sh

JSON=`sh ./git-top.sh core ml platform aim track identity infra mud | sed -E 's/^[^0-9]+([0-9]+).([a-z]+)/,\["\2",\1]/'`
JSON=`echo "$JSON" | sed -E 's/^([a-z]+)/GitTop\["\1"\] = [/'`

echo $JSON | 
  sed 's/.GitTop/\]; GitTop/g' |
  sed 's/\[ ,\[/\[\[/g' |
  sed 's/^/var GitTop = []; /' |
  sed 's/\]$/\]\];/' > repos.js

