#!/bin/sh

help_message() {
	echo "Usage: $0 COMMAND [PROMPT_TEXT]"
	echo "Example: $0 \"shutdown now\" \"Log Off and Shutdown?\""
	exit
}

case $1 in
	"" | "-h" | "--help" ) help_message;;
esac

PROMPT=$2
if [ -z $2 ]; then
	PROMPT="Are you sure?"
fi
echo $PROMPT
zenity --question --text="$PROMPT"
RES=$?

# 0 -> YES
# 1 -> NO

if [ $RES -eq 0 ]; then
	eval $1
fi
