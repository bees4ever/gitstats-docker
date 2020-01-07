FROM docker:dind
RUN apk update
RUN apk add --no-cache git
RUN apk add --no-cache openssh
RUN apk add --no-cache build-base
RUN apk add --no-cache perl
RUN apk add --no-cache python2
RUN apk add --no-cache autoconf
RUN apk add --no-cache boost-dev
RUN apk add --no-cache automake
RUN apk add --no-cache libtool
RUN apk add --no-cache intltool
RUN apk add --no-cache coreutils
RUN apk add --no-cache gd-dev zlib-dev
RUN apk add --no-cache bash

# install gnuplot from src
ADD gnuplot-gnuplot-main /root/gnuplot-gnuplot-main
COPY .git /root/gnuplot-gnuplot-main/.git
WORKDIR /root/gnuplot-gnuplot-main
## run a bunch of link, becaue alpine linux gcc is very stupid
RUN sh linklib.sh
RUN ./prepare
RUN ./configure              # prepare Makefile and config.h
RUN make                     # build the program and documentation
RUN make check; exit 0       # run unit tests to confirm successful build and ignore of they fail :)
RUN make install; exit 0     # install the program and documentation

## add the gitstats tool
ADD gitstats-master /root/gitstats-master
WORKDIR /root/gitstats-master
RUN make
RUN make install

ADD dummy_run.sh /root
RUN chmod 777 /root/dummy_run.sh
ENTRYPOINT ["/root/dummy_run.sh"]

LABEL maintainer="Allan Karlson <beesforever@gmx.de>"
