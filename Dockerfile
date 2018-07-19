# First attempt. Don't judge me too harshly

FROM alpine:3.8

MAINTAINER Derek 

# install tools
RUN apk add --update alpine-sdk cmake linux-headers

# install opencv
RUN git clone https://github.com/opencv/opencv.git; cd opencv && \
    mkdir -p release; cd release; \
    cmake -D CMAKE_BUILD_TYPE=release ..; \
    make

# create working directory
WORKDIR /app
# put opencv in a sub-folder to keep working dir clean
ADD . /app/opencv

ENTRYPOINT ["/app/"]
