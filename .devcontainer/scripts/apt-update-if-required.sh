#! /usr/bin/env bash
#
# Update the package list when required.
# Syntax: ./apt-update-if-required.sh

if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
    echo "Running apt-get update..."
    apt-get update
else
    echo "Skipping apt-get update."
fi