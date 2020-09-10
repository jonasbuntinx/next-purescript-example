#!/usr/bin/env bash

FILES=$@

declare -a PAGES

for f in $FILES
do
  PAGES=(${PAGES[@]} $(basename $f))
done

zephyr -f ${PAGES[*]}
