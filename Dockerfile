FROM node:latest

MAINTAINER Rohan Ferris

ENV hudir /hubot

WORKDIR ${hudir}

#RUN mkdir ${hudir}

COPY * ${hudir}

RUN \
    cd ${hudir} && \
    npm install

CMD cd {$hudir}; bin/hubot --adapter slack
