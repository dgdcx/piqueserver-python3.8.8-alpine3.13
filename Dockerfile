FROM        python:3.8.8-alpine3.13
LABEL       author="Sonicscream" maintainer="sonicscream@cryptoclover.cc"
RUN         apk update && \
            apk upgrade && \
            apk add --no-cache --virtual delete_me git cargo g++ && \
            apk add --no-cache --virtual keep_me zlib-dev jpeg-dev libffi-dev openssl-dev libjpeg libstdc++ openssl && \
            git --version && \
            python --version && \
            pip --version && \
            export TMPDIR='/var/tmp' && \
            pip install git+git://github.com/piqueserver/piqueserver.git@269356a20c5858c7290f0a43ce5a1f319efe8647 && \
            apk del delete_me
RUN         pip install websockets
