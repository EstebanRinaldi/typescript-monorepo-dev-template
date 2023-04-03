ARG VARIANT=latest
FROM mariadb:${VARIANT}

# Copy all scripts and allow execution.
COPY ./scripts /scripts
RUN chmod +x /scripts/*

# Set timezone
ARG TIMEZONE
RUN /scripts/set-timezone.sh "${TIMEZONE}"

# Install locales and set locale and language.
ARG LOCALE="C.UTF-8"
ARG ADDITIONAL_LOCALES=""
RUN /scripts/install-locales.sh "${ADDITIONAL_LOCALES} ${LOCALE}"
ENV LC_ALL="${LOCALE}" 
ENV LANG="${LOCALE}"

# Update local packages and cleanup.
RUN /scripts/apt-upgrade.sh && /scripts/cleanup.sh && rm -rf /scripts

# Copy and set permissions on configuration file.
COPY ./mariadb/my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 0444 /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
