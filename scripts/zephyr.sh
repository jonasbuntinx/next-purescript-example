#!/usr/bin/env bash

FILES="./corefn/Pages.*"

declare -a PAGES

for f in $FILES
do
  PAGES=(${PAGES[@]} $(basename $f))
done

zephyr -f -i "corefn" -o "build" ${PAGES[*]}
