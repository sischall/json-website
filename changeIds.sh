#!/bin/bash

FILENAME=9mbchangeUUID.json

#get the lengt of the list
size=$(jq '. | length' $FILENAME)

#iterate over each list element
for (( i=0; i < $size; i++ ))
do
	echo "iteration for $i"
	jq --arg uuid $(uuidgen) '.['$i'].id = $uuid' $FILENAME >temp.json
	mv temp.json $FILENAME
done
#create a new UUID

#write the new UUID to the i-th list element
