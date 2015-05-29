FROM clojure:lein-2.5.1
MAINTAINER Ethan Liu <ethan-liu@outlook.com>

# Containerized version of zk-web (https://github.com/qiuxiafei/zk-web)

RUN apt-get update && apt-get install -y --no-install-recommends git

ENV LEIN_ROOT=yes
# Pre-initialize leiningan
RUN lein

RUN git clone https://github.com/qiuxiafei/zk-web.git /zk-web

WORKDIR /zk-web
RUN lein deps

EXPOSE 8080

ENTRYPOINT lein run
