#!/bin/sh
FILES=./*wins
for f in $FILES; do
    grep "1 wins" $f | awk '{print $5}' > $f.p1
    nb=`wc -l ${f}.p1 | awk '{print $1}'`
    if [ $nb == 0 ]
    then
        echo 0 > ${f}.p1
    fi
    grep "2 wins" $f | awk '{print $5}' > $f.p2
    nb=`wc -l ${f}.p2 | awk '{print $1}'`
    if [ $nb == 0 ]
    then
        echo 0 > ${f}.p2
        cat ${f}.p2
    fi
done
