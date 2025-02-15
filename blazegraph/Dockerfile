FROM jetty:9.4.57-jdk8-amazoncorretto

LABEL authors="mark.cooper@lyrasis.org,jonathan.green@lyrasis.org"

ENV BLAZEGRAPH_NAME=yago \
    BLAZEGRAPH_RW_PATH=/RWStore.properties \
    BLAZEGRAPH_VERSION=CANDIDATE_2_1_5 \
    JAVA_OPTS="-Xmx1g" \
    JETTY_WEBAPPS=/var/lib/jetty/webapps \
    BLAZEGRAPH_UID=888 \
    BLAZEGRAPH_GID=888
ENV BLAZEGRAPH_VERSION_URL https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_${BLAZEGRAPH_VERSION}/blazegraph.war

ADD RWStore.properties $BLAZEGRAPH_RW_PATH
ADD entrypoint.sh /var/lib/jetty/entrypoint.sh

USER root

# Install necessary packages using yum
RUN yum install -y openssl bash curl wget && \
    yum clean all

# Install gosu
ENV GOSU_VERSION 1.17
RUN set -eux; \
    \
    rpmArch="$(rpm --query --queryformat='%{ARCH}' rpm)"; \
    case "$rpmArch" in \
    aarch64) dpkgArch='arm64' ;; \
    armv[67]*) dpkgArch='armhf' ;; \
    i[3456]86) dpkgArch='i386' ;; \
    ppc64le) dpkgArch='ppc64el' ;; \
    riscv64 | s390x) dpkgArch="$rpmArch" ;; \
    x86_64) dpkgArch='amd64' ;; \
    *) echo >&2 "error: unknown/unsupported architecture '$rpmArch'"; exit 1 ;; \
    esac; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
    \
    chmod +x /usr/local/bin/gosu; \
    # verify that the binary works
    gosu --version; \
    gosu nobody true


RUN wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL
RUN chmod +x /var/lib/jetty/entrypoint.sh

WORKDIR /var/lib/jetty
CMD ./entrypoint.sh
