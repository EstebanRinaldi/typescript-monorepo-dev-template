#! /usr/bin/env bash
#
# Creates and adds sudo support for the provided non-root user.
# Syntax: ./create-user.sh [username] [user UID] [user GID]

# Stores the parameters.
USERNAME=${1:-"user"}
USER_UID=${2:-1000}
USER_GID=${3:-1000}

# Exit immediately if a command exits with a non-zero status.
set -e

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "${USERNAME}" = "root" ]; then
    echo 'The new username can not be "root". Select another username.'
    exit 1
fi

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

# Create or update a non-root user to match UID/GID.
if id -u ${USERNAME} > /dev/null 2>&1; then
    # User exists, update if needed
    if [ "$USER_GID" != "$(id -G $USERNAME)" ]; then
        groupmod --gid $USER_GID $USERNAME
        usermod --gid $USER_GID $USERNAME
    fi
    if [ "$USER_UID" != "$(id -u $USERNAME)" ]; then
        usermod --uid $USER_UID $USERNAME
    fi
else
    # Create user
    groupadd -o --gid $USER_GID $USERNAME
    useradd -o -s /bin/sh --uid $USER_UID --gid $USER_GID -m $USERNAME
fi

# Installs and add sudo support for non-root user
sh $(dirname "$0")/add-sudo-support.sh $USERNAME
