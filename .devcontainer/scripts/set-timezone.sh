#! /usr/bin/env bash
#
# Installs the provided packages.
# Syntax: ./set-timezone.sh [timezone]

# Stores the first parameter.
TIMEZONE=${1:-""}

# If no parameters provided exits.
if [ -z "${TIMEZONE}" ]; then
    echo 'Not changing timezone.'
    exit 1
fi

# Sets the timezone.
echo "Setting local TIMEZONE to ${TIMEZONE}"
rm -f /etc/localtime &&
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone