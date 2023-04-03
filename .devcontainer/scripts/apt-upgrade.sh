#! /usr/bin/env bash
#
# Update the package list when required and upgrades the installed packages.
# Syntax: ./apt-upgrade.sh

# Exit immediately if a command exits with a non-zero status.
set -e

sh $(dirname "$0")/apt-update-if-required.sh
apt-get -y upgrade --no-install-recommends
apt-get autoremove -y