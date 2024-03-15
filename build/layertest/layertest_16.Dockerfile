ARG IMAGE="quay.io/dkwon17/storage-driver-test:layer-image"
FROM ${IMAGE}

# Edit a random file in the test directory.
WORKDIR "/test"
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
RUN sed -i '$s/.$/'"$RANDOM"'/' $(ls | shuf -n 1)
