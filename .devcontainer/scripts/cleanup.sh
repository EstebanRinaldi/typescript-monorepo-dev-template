#! /usr/bin/env bash
#
# Removes unneded packages and files.
# Syntax: ./cleanup.sh

# Remove packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed.
# Clears out the local repository of retrieved package files.
# It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial/.
apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /root/.gnupg /tmp/library-scripts
