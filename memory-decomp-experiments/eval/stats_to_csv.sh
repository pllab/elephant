#!/bin/sh

for dat in $@; do
	echo "$dat"

	STATS="$dat"
	NAME=$(echo "$STATS" | cut -d . -f 1)
	CSV="$NAME.csv"
	[ -f $CSV ] && rm $CSV

	start=`tac "$STATS" | rg -m 1 -n "Number of cells:" | cut -d: -f 1`
	
	tail -n $start $STATS | rg '\$[a-zA-Z]*dff[a-zA-Z]*_' | while read -r dff ; do
		r=`echo "$dff" | cut -d_ -f 1`
		w=`echo "$dff" | cut -d_ -f 2 | cut -w -f 1`
		n=`echo "$dff" | cut -d_ -f 2 | cut -w -f 2`
		echo "$r, $w, $n" >> $CSV
	done
	
	cat $STATS | rg 'memory width \d+ size \d+' | while read -r mem ; do
		w=`echo "$mem" | cut -w -f 3`
		s=`echo "$mem" | cut -w -f 5`
		echo "mem, $w, $s" >> $CSV
	done
done

