#!/usr/bin/env bash

for i in $@; do
	if [ -f $i ]; then
		mv $i /home/sandeep/.local/share/Trash/;
	fi
done
