# syntax=docker/dockerfile:1

FROM ubuntu:22.04
COPY ./setup.sh ./setup.sh
RUN chmod +x ./setup.sh
CMD appium
