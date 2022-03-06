FROM        python:3.8.8-alpine3.13
LABEL       author="Sonicscream" maintainer="sonicscream@dgd.cx"
RUN         apk update
RUN         apk upgrade
RUN         apk add --no-cache --virtual delete_me git cargo g++
RUN         apk add --no-cache --virtual keep_me zlib-dev jpeg-dev libffi-dev openssl-dev libjpeg libstdc++ openssl
RUN         export TMPDIR='/var/tmp'
RUN         pip install git+git://github.com/voxide-aos/piqueserver.git@3b46766fea6d90ab3cb3c15332e9bf6d5dfbd04f
RUN         apk del delete_me
RUN         pip install websockets==8.1
RUN         pip install geoip2
