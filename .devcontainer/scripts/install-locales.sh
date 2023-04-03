#! /usr/bin/env bash
#
# Installs the provided packages.
# Syntax: ./install-locales.sh [additional-locales]

# Stores the first parameter.
ADDITIONAL_LOCALES=${1:-""}

# Exit immediately if a command exits with a non-zero status.
set -e

# If no parameter provided exits.
if [ -z "${ADDITIONAL_LOCALES}" ]; then
    echo 'No additional locales required.'
    exit 1
fi

# Installs the locales package.
sh $(dirname "$0")/apt-install.sh "locales"

# Trims the locales list.
ADDITIONAL_LOCALES="$(echo "${ADDITIONAL_LOCALES}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

# Installs the locales.
echo '' >> /usr/share/locale/locale.alias
temp="${ADDITIONAL_LOCALES%\"}"
temp="${temp#\"}"
for i in ${temp}; do sed -i "/$i/s/^#//g" /etc/locale.gen; done
locale-gen
