#!/bin/sh

me=OLMCTS
opp=ONESTEP
games=100
for p in 0 1 10 11 100 110; do
./EditAndRun.sh ${me} ${opp} 1 1 ${games} 100 ${p} &
done
