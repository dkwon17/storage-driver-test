ARG IMAGE="alpine:latest"
FROM ${IMAGE}

ARG FILES_CREATE=1
ARG FILE_SIZE="4K"

RUN apk add --no-cache --upgrade bash

COPY ./scripts/write_files.sh /
RUN ./write_files.sh test ${FILES_CREATE} ${FILE_SIZE}
