#!/bin/bash

## global  --------------------------------------------------------------------------------------------------------
out_folder="./data";
cores="all";
duration="2000";

[ -d "$out_folder" ] || mkdir $out_folder;

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## settings --------------------------------------------------------------------------------------------------------

initials="128 1024 8192";
updates="0 10 50";

for initial in $initials; 
do
    echo "* -i$initial";

    range=$((2*$initial));

    for update in $updates;
    do
	echo "** -u$update";

	out="$out_folder/ll.i$initial.u$update.dat";
	./scripts/scalability2.sh "$cores" ./bin/lb-ll ./bin/lf-ll -d$duration -i$initial -r$range -u$update | tee $out;
    done
done

