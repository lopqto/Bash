#!/bin/bash

function extract {
	file="$1" # simpler code
	
	case "${file#*.}" in # Match file extension 
		"tar.gz"  ) tar xvzf "$file" 		;;
		"tar.gz2" ) tar xvjf "$file" 		;;
		"zip" 	  ) unzip "$file"    		;;
		"rar"     ) unrar e "$file"  		;;
		"xz"	  ) unxz "$file"		;;
		*	  ) echo "Unkown file type" >&2 ;;
	esac

}

for file in "$@"
do
	extract "$file"
done

