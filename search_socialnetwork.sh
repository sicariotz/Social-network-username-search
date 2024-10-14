#!/bin/bash

# Check if Zenity is installed
if ! command -v zenity &> /dev/null; then
    echo "Zenity is not installed. Please install it and try again."
    exit 1
fi

# Get the username from a GUI input dialog
USERNAME=$(zenity --entry --title="Username Search" --text="Enter the username to search:")

# Check if the user provided a username
if [ -z "$USERNAME" ]; then
    zenity --error --text="No username provided. Exiting."
    exit 1
fi

# Define the URLs for different social networks
declare -A urls=(
    ["Instagram"]="https://www.instagram.com/$USERNAME"
    ["Twitter"]="https://twitter.com/$USERNAME"
    ["Facebook"]="https://www.facebook.com/$USERNAME"
    ["LinkedIn"]="https://www.linkedin.com/in/$USERNAME"
    ["GitHub"]="https://github.com/$USERNAME"
)

# Open each URL in the default web browser
for platform in "${!urls[@]}"; do
    zenity --info --text="Searching for $USERNAME on $platform..."
    xdg-open "${urls[$platform]}"
done

zenity --info --text="Search completed!"

