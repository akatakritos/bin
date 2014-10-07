#!/bin/sh

# Installs all scripts to the ~/bin directory as soft links
SCRIPT_NAME=$(basename $0)

function simlink() {
	if [ -f "$HOME/bin/$1" ]; then
		echo "Skippng $1"
	else
		echo "Linking $1"
		ln -s "$(readlink -f -- $1)" "$HOME/bin/$1"
	fi
}

for f in "$@"; do
	if [ "$f" != "$SCRIPT_NAME" ]; then
		simlink $f
	fi
done
