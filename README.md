# gitstats-docker


## About

`gitstats` is a nice tool written in C, but is not available as an alpine linux package. Also it need `gnuplot` but the corresponding alpine package uses a strange png package and not the original. 

Therefore this repo set up both tools correctly and build it from the source. It therefore needs some tiny hacks to get the gcc under alpine run correctly.


This is a fork of https://sourceforge.net/p/gitstats/wiki/Home/ and https://sourceforge.net/p/gnuplot/gnuplot-main/ci/master/tree/

## Deploy

To deploy a current version to `Docker`simply run these lines:

1. `docker build -t gitstats-docker .`
1. `docker tag gitstats-docker bees4ever/gitstats-docker:latest`
1. `docker push bees4ever/gitstats-docker:latest`

Then we see under https://hub.docker.com/repository/docker/bees4ever/docker-git-ssh a new version is published