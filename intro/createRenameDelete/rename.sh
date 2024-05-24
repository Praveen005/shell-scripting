#!/bin/bash


# ----------------------------------CREATION-------------------------------------------------
 


# Created some sample images I can rename in subsequent command
start=1
end=7

for ((INDEX=start; INDEX<=end; INDEX++)); do
    NAME="image${INDEX}.jpg"
    touch "${NAME}"

    echo "Created ${NAME}"

done

sleep 2


# ---------------------------------RENAMING--------------------------------------------------


# glob = global
# Use ./*glob* or -- *glob* so names with dashes won't become options.
# Prefix the glob pattern with ./ to ensure filenames start with ./.
# Use -- before the glob pattern to indicate the end of options.
# Hence we use (ls ./*.jpg) and not (ls*.jpg)

PICTURES=$(ls ./*.jpg)
DATE=$(date +%F)

for PICTURE in ${PICTURES}; do

    BASENAME=$(basename "${PICTURE}")

    NEWNAME="${DATE}-${BASENAME}"
    mv "${PICTURE}" "./${NEWNAME}"

    # echo "Re-named ${PICTURE} to ${NEWNAME}"
    echo "Re-named ${BASENAME} to ${NEWNAME}"
 
done


sleep 2


# ----------------------------------DELETION-------------------------------------------------

# Delete the images you created. Sounds fun na?   :P



# -p: Displays a prompt to the user. The string following -p will be displayed without a newline before reading the input.

# -n 1: Specifies that only one character should be read from the input. This limits the user to providing a single character response (in this case, 'y' or 'n').

# -r: Prevents backslashes from being treated as escape characters. This is useful when you want to read raw input from the user without any modifications.

# After -p option, prompt text should follow
read -r -p "Are you sure you want to delete all .jpg files in the current directory? (y/n) " -n 1
echo  #Move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    for FILE in ./*.jpg; do

        if [ -f "${FILE}" ]; then
            echo "Deleted ${FILE}"
            rm "${FILE}" || echo "Failed to delete: $FILE"
        else
            echo "No ${FILE} exists!"
        fi
        
    done
else
    echo "Deletion aborted."
fi