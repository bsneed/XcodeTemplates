#!/bin/sh

# get the username, comes back as "Sneed, Brandon"
USERNAME=$(id -F)
# duplicate the way xcode does dates in it's templates: 8/1/17
DATE=$(date +%m/%d/%y | sed 's/^0//g')


ackInstalled() {
	if ! [ -x "$(command -v ack)" ]; then
		echo >&2 "error: Ack is not installed, install 'ack' via brew."
		exit 1; 
	fi
}

renameInstalled() {
	if ! [ -x "$(command -v rename)" ]; then
		echo >&2 "error: Rename is not installed, install 'rename' via brew."
		exit 1; 
	fi
}

copyTemplateToNewPath() {
	cp -rf $1 $2
}

renameFiles() {
	# need to do multiple passes.  first directories will get hit, then filenames, at various levels.
	while true; do
		echo "Renaming files ..."
		str=$(find $1/. -name "$2*" -print0 | xargs -0 rename --subst-all "$2" "$3" 2>&1)
		if [ "$str" = "" ]; then
			break
		fi
	done
}

replaceOccurrences() {
	ack --literal --files-with-matches "$1" --print0 "$3" | xargs -0 sed -i "" "s/$1/$2/g"
}

replaceOrgNames() {
	# remove any funky characters
	INPUTORGNAME=$(echo "$1" | sed -e "s/[^a-zA-Z0-9_ -]//g")
	
	NEWORGNAME="$INPUTORGNAME"
	NEWORGBUNDLENAME=$(echo $1 | tr [":upper:"] "[:lower:]")

	ack --literal --files-with-matches "__TemplateOrgName__" --print0 "$2" | xargs -0 sed -i "" "s/__TemplateOrgName__/$NEWORGNAME/g"
	ack --literal --files-with-matches "__templateorgname__" --print0 "$2" | xargs -0 sed -i "" "s/__templateorgname__/$NEWORGBUNDLENAME/g"
	ack --literal --files-with-matches "\-\-templateorgname\-\-" --print0 "$2" | xargs -0 sed -i "" "s/--templateorgname--/$NEWORGBUNDLENAME/g"
}

replaceCreationInfo() {
	ack --literal --files-with-matches "//  Created by" --print0 "$1" | xargs -0 sed -i "" "s|^//  Created by.*|//  Created by $USERNAME on $DATE.|g"
}

OLDNAME=$1
NEWNAME=$2
WORKDIR=$3
NEWPATH=${WORKDIR%%/}${WORKDIR:+/}${NEWNAME}

# remove bad characters
OLDNAME=`echo "${OLDNAME}" | sed -e "s/[^a-zA-Z0-9_ -]//g"`
NEWNAME=`echo "${NEWNAME}" | sed -e "s/[^a-zA-Z0-9_ -]//g"`

if [ "$OLDNAME" = "" -o "$NEWNAME" = "" ]; then
	echo "usage: $0 <template> <new_name> <directory>"
	exit 2
fi

if [ "$WORKDIR" = "" ]; then
	echo "usage: $0 <template> <new_name> <directory>"
	exit 2
fi

echo "${NEWNAME}" | grep "${OLDNAME}" > /dev/null
if [ $? -eq 0 ]; then
	echo "${NEWNAME}, ${OLDNAME}"
 	echo "error: new project name cannot contain the template name."
 	exit 2
fi

if [ ! -d "${OLDNAME}" ]; then
  	echo "error: \"${OLDNAME}\" must be a directory"
  	exit 2
fi 

# set new project directory
if [ -d "${NEWPATH}" ]; then
  	echo "error: project directory \"${NEWPATH}\" exists. Terminating."
  	exit 2
fi

ackInstalled
renameInstalled

echo "\nCopying $OLDNAME to $NEWPATH"
copyTemplateToNewPath $OLDNAME $NEWPATH

echo "Renaming files ..."
renameFiles $NEWPATH $OLDNAME $NEWNAME

echo "Replacing occurences of $OLDNAME with $NEWNAME ..."
replaceOccurrences $OLDNAME $NEWNAME $NEWPATH

echo "Replacing creation info with: // Created by $USERNAME on $DATE."
replaceCreationInfo $NEWPATH

echo "\nEnter the desired Organization name:"
read ORGNAME
replaceOrgNames $ORGNAME $NEWPATH

echo "\nDone.  The new project now lives here: $NEWPATH"


