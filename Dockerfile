FROM node:latest

MAINTAINER Rohan Ferris

ENV hudir /hubot

WORKDIR ${hudir}

#RUN mkdir ${hudir}

COPY hubot/ ${hudir}/

RUN \
    cd ${hudir} && \
    npm install

CMD bin/hubot --adapter slack
