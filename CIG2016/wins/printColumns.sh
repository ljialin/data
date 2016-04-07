#!/bin/sh
FILES=./data/*200.txt
for f in $FILES; do
    awk -F "," -v f=1 -v t=101 '{for(i=f;i<=t;i++) printf("%s,%s",$i,(i==t)?"\n":OFS)}' $f > $f.all
    awk -F "," -v f=102 -v t=202 '{for(i=f;i<=t;i++) printf("%s,%s",$i,(i==t)?"\n":OFS)}' $f > $f.p1
    awk -F "," -v f=203 -v t=303 '{for(i=f;i<=t;i++) printf("%s,%s",$i,(i==t)?"\n":OFS)}' $f > $f.p2
done
