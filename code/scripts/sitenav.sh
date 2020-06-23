#! /usr/bin/env bash

# Inserts links to the 10 most recent notebook entries in sitenav.st

WIKIROOT="$( dirname "${BASH_SOURCE[0]}" )/../.."
NOTEBOOK="${WIKIROOT}/notebook"
TEMPLATE="${WIKIROOT}/code/gitit/templates/sitenav.st"
TMPFILE="${TEMPLATE}.tmp"

generate_links() {
	nlinks="$1"
  ls $NOTEBOOK | grep -v '.page' | while IFS='_' read day name; do
    href="\$base\$/notebook/${day}_${name}/readme.md"
    line="<li><a href=\"$href\">$name</a></li>"
    echo "$line"
  done | tail -n${nlinks} | tac > "$TMPFILE"
}

replace_links() {
  # see superuser.com/questions/440013
  lead='^<!-- BEGIN AUTO-GENERATED NOTEBOOK ENTRIES -->$'
  tail='^<!-- END AUTO-GENERATED NOTEBOOK ENTRIES -->$'
  sed -i "/$lead/,/$tail/{ /$lead/{p; r $TMPFILE
          }; /$tail/p; d }" "$TEMPLATE"
}

# main
cleanup() { rm -rf "$TMPFILE"; }
trap cleanup EXIT
generate_links "$1"
replace_links
