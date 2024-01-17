#!/bin/bash

function rename_for_pub() {
    # Assuming the existing directory is stored in a variable
    existing_directory="yyyy/mm/dd/1/"

    # Extract the base path without the counter and post.txt
    base_path=$(dirname $existing_directory)
    echo "base_path: $base_path"

    # Get current date in yyyy/mm/dd format
    current_date=$(date +"%Y/%m/%d")

    # Starting counter
    counter=1

    # Construct new directory path
    new_directory="$current_date/$counter"

    # Check if the new directory exists and increment the counter if it does
    while [[ -d "$new_directory" ]]; do
        ((counter++))
        new_directory="$current_date/$counter"
    done

    # Perform the rename
    mkdir -p $new_directory
    echo "Directory created: $new_directory"
    # mv yyyy/mm/dd/1/* 2024/01/09/1
    mv $existing_directory* $new_directory

    echo "Moved content to $new_directory"
    rm -r yyyy/
    echo "Removed existing directory"

    #replace date in post
    if [ "$(uname)" == "Darwin" ]; then
        CURRENT_DATE=$(TZ=UTC gdate -d "+1 hour" +"%Y-%m-%d %T")
        echo "publish date: $CURRENT_DATE"
        sed -i '' -e "s/date: '???'/date: '$CURRENT_DATE'/" "$new_directory/post.md"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        CURRENT_DATE=$(TZ=UTC date -d "+1 hour" +"%Y-%m-%d %T")
        sed -i "s/date: '???'/date: '$CURRENT_DATE'/" "$new_directory/post.md"
    fi
}

new_stub_directory="yyyy/mm/dd/1"

function new_stub() {
    echo $1
    if [ -z "$1" ]
    then
        echo "no second parameter"
        exit 1
    fi
    if [[ ! -d $new_stub_directory ]]
    then
        mkdir -p $new_stub_directory
        case $1 in 
            "de-direct")
                cat .templates/de-direct.md >> $new_stub_directory/post.md
                ;;
            "de-article")
                cat .templates/de-article.md >> $new_stub_directory/post.md
                ;;
            "en-direct")
                cat .templates/en-direct.md >> $new_stub_directory/post.md
                ;;
            "en-article")
                cat .templates/en-article.md >> $new_stub_directory/post.md
                ;;
            *)
                echo "unknown template: $1"
                exit 1
                ;;
        esac
    else
        echo "directory already exists"
    fi
}

case $1 in
    "prep")
        rename_for_pub
        ;;
    "new")
        echo $2
        new_stub $2
        ;;
esac
