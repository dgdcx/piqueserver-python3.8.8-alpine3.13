FROM        python:3.8.8-alpine3.13
LABEL       author="Sonicscream" maintainer="sonicscream@cryptoclover.cc"
RUN         apk update && \
            apk upgrade && \
            apk add --no-cache --virtual delete_me git cargo g++ && \
            apk add --no-cache --virtual keep_me zlib-dev jpeg-dev libffi-dev openssl-dev && \
            git --version && \
            python --version && \
            pip --version && \
            export TMPDIR='/var/tmp' && \
            pip install git+git://github.com/piqueserver/piqueserver.git@02a130832400332c94bfcfee7b4bff7b2274659a && \
            apk del delete_me && \
            apk add --no-cache libstdc++
