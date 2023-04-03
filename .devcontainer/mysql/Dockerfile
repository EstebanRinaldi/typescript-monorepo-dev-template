ARG VARIANT=latest
FROM mysql:${VARIANT}-debian

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

# Copy and set permissions on configuration file.
COPY ./mysql/my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 0444 /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
