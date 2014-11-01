# Add information about Author

#!/bin/bash
#DIRECTORY_PATH="."
CHANGING_WORD=$2
NEW_WORD=$3
TFILE="/tmp/out.tmp.$$"

#TODO add varidations for the variables

#TODO move the implementation to a function
# DONE.
function changeWord {
DIRECTORY_PATH=$1
echo $DIRECTORY_PATH
for CURRENT_FILE in "$DIRECTORY_PATH"/*;
do
    if [ -d $CURRENT_FILE ]; then
        changeWord $CURRENT_FILE
    else
        sed "s/$CHANGING_WORD/$NEW_WORD/g" "$CURRENT_FILE" > $TFILE 
        mv $TFILE "$CURRENT_FILE"
    fi
done
}

changeWord $1
#function ask {
#    NUMBER=$1
#    if ((NUMBER == 0)); then
#        exit
#    fi
#    ((NUMBER--))
#    echo $NUMBER
#    ask $NUMBER
#}
#ask 5

