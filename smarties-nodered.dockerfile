# syntax=docker/dockerfile:1
FROM nodered/node-red:latest
RUN npm install node-red-contrib-tableify
