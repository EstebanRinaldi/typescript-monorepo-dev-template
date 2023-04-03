#! /usr/bin/env bash
#
# Installs and adds sudo support for non-root user.
# Syntax: ./add-sudo-support.sh [username]

# Stores the parameters.
USERNAME=${1:-"user"}

# Installs sudo
sh $(dirname "$0")/apt-install.sh sudo

# Includes username on sudoers.
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME
