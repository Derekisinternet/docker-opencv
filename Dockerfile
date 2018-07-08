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
ADD . /app
# RUN cd  /app/build && \
#     ./makeCMakeLists.sh -r && \
#     cmake -D CMAKE_INSTALL_PREFIX=/opencv/release .. && \
#     make

ENTRYPOINT ["/app/build"]
