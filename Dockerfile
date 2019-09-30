FROM python:3.7-alpine AS build
RUN apk add bash gcc libc-dev zlib-dev bzip2-dev xz-dev curl-dev openssl-dev make
RUN pip3 install numpy==1.17.2
RUN pip3 install pysam==0.15.3
RUN pip3 install crossmap==0.3.7

FROM python:3.7-alpine
RUN apk add bash gcc zlib xz-libs libbz2 curl openssl
COPY --from=build /usr/local /usr/local
ADD run.sh /
ADD Dockerfile /
ENTRYPOINT [ "/bin/bash", "/run.sh" ]
