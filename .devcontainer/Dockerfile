# [Choice] Node.js version
# https://github.com/nodejs/docker-node
ARG VARIANT=lts
FROM node:${VARIANT}

# Update yarn to latest stable version
RUN yarn set version stable

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

# Copy all scripts and allow execution.
COPY ./scripts /scripts
RUN chmod +x /scripts/*

# Patch if node:14
RUN /scripts/add-node-patch.sh "${VARIANT}"

# Install apt-utils
RUN /scripts/apt-install.sh "apt-utils"

# Non-root user.
ARG USERNAME=node

# Set timezone
ARG TIMEZONE
RUN /scripts/set-timezone.sh "${TIMEZONE}"

# Install locales and set locale and language.
ARG LOCALE="C.UTF-8"
ARG ADDITIONAL_LOCALES=""
RUN /scripts/install-locales.sh "${ADDITIONAL_LOCALES} ${LOCALE}"
ENV LC_ALL="${LOCALE}"
ENV LANG="${LOCALE}"

# Install needed packages.
RUN /scripts/apt-install.sh "apt-transport-https curl ca-certificates tar gnupg2"

# Update local packages and cleanup.
RUN /scripts/apt-upgrade.sh && /scripts/cleanup.sh && rm -rf /scripts

# Configure global npm install location, use group to adapt to UID/GID changes
ARG NPM_GLOBAL=/usr/local/share/npm-global
ENV PATH=${NPM_GLOBAL}/bin:${PATH}
RUN if ! cat /etc/group | grep -e "^npm:" > /dev/null 2>&1; then groupadd -r npm; fi \
    && usermod -a -G npm ${USERNAME} \
    && umask 0002 \
    && mkdir -p ${NPM_GLOBAL} \
    && touch /usr/local/etc/npmrc \
    && chown ${USERNAME}:npm ${NPM_GLOBAL} /usr/local/etc/npmrc \
    && chmod g+s ${NPM_GLOBAL} \
    && npm config -g set prefix ${NPM_GLOBAL} \
    && su ${USERNAME} -c "npm config -g set prefix ${NPM_GLOBAL}" 

# Install pnpm
RUN su ${USERNAME} -c "umask 0002 && npm install -g pnpm" 

# [Optional] Install global extra modules.
ARG GLOBAL_EXTRA_MODULES=""
RUN if test -z "$GLOBAL_EXTRA_MODULES" ; \
    then echo "No extra global modules to install" ; \
    else su ${USERNAME} -c "umask 0002 && npm install -g ${GLOBAL_EXTRA_MODULES}" ; fi \
    && npm cache clean --force > /dev/null 2>&1

# Change to non-root user.
USER ${USERNAME}
