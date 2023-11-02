# syntax=docker/dockerfile:1

FROM curl:8.4.0
COPY ./setup.sh ./setup.sh
RUN chmod +x ./setup.sh
RUN ./setup.sh
ENTRYPOINT ["tail", "-f", "/dev/null"]
