#!/bin/bash
# This variable will store the path to the directory containing the image files.
DIR="assets/images"

# The current filename (including the path) is assigned to the FILE variable.
for FILE in "$DIR"/*.jpg
do

    # This line extracts the base filename (without the directory path) from the FILE variable using the basename command.
    # For example, if FILE is "assets/images/img1.jpg", BASE will become "img1.jpg".
    BASE=$(basename "$FILE")


    # ${BASE#img}: This part removes the "img" prefix from the BASE filename.
    # pic: The prefix to be added to the new filename.
    NEWNAME="pic${BASE#img}"


    # This line renames (moves) the original file ($FILE) to the new filename ($DIR/$NEWNAME) within the same directory.
    mv "$FILE" "$DIR/$NEWNAME"
done



# for the current working directory, just have
# for FILE in *.jpg