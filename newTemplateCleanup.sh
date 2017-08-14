removePersonalizedCreationInfo() {
	USERNAME="Last, First"
	# duplicate the way xcode does dates in it's templates: 8/1/17
	DATE="xx/xx/xx"
	
	echo $USERNAME
	echo $DATE
	
	ack --literal --files-with-matches "//  Created by" --print0 "$1" | xargs -0 sed -i "" "s|^//  Created by.*|//  Created by $USERNAME on $DATE.|g"
}

removePersonalizedCreationInfo $1