#! /usr/bin/env bash
#
# Installs the provided package list.
# Syntax: ./apt-install.sh [package list]

# Stores the first parameter.
PACKAGES=${1:-""}

# Exit immediately if a command exits with a non-zero status.
set -e

# If no parameter provided exits.
if [ -z "$PACKAGES" ]
then
    echo 'No package provided.'
    exit 1
fi

# Updates the apt cache if required.
sh $(dirname "$0")/apt-update-if-required.sh

apt-get install -y --no-install-recommends ${PACKAGES}
