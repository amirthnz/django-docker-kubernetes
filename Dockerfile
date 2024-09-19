FROM python:3.12.0-alpine3.18

# Install alpine's dependencies
# libffi-dev for cryptography
# libxml2-dev & libxslt-dev for lxml
# jpeg-dev zlib-dev for Pillow
# gettext django internationalization
RUN set -ex \
    && apk add --no-cache --virtual .build-deps build-base mariadb-dev \
    && apk add python3-dev musl-dev libffi-dev libxml2-dev libxslt-dev jpeg-dev zlib-dev gettext mariadb-client git

ADD ./requirements.txt /thnz/requirements.txt

# Skip rust installation and other related dependencies
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

# Create python's env and Install django's dependencies
RUN set -ex \
    && python -m venv /env \
    && /env/bin/pip install --upgrade pip \
    && /env/bin/pip install --no-cache-dir -r /thnz/requirements.txt \
    && runDeps="$(scanelf --needed --nobanner --recursive /env \
    | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
    | sort -u \
    | xargs -r apk info --installed \
    | sort -u)" \
    && apk add --virtual rundeps $runDeps

# Remove build-deps, because it's no longer needed
RUN set -ex \
    && apk del .build-deps




COPY . /thnz
WORKDIR /thnz

ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

# run entrypoint.sh
ENTRYPOINT ["/thnz/entrypoint.sh"]
