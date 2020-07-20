# reasonably recent openresty
FROM openresty/openresty:focal

# tools for building the image
RUN apt-get -y update && apt-get -y install subversion

# install ZBS debuggee
ENV ZBS_MAJOR 1
ENV ZBS_MINOR 90
ENV ZBS_VERSION $ZBS_MAJOR.$ZBS_MINOR
ENV ZBS /ZBS
RUN mkdir -p $ZBS/bin/linux/x64 \
    && cd $ZBS/bin/linux/x64 \
    && svn export https://github.com/pkulchenko/ZeroBraneStudio/tags/$ZBS_VERSION/bin/linux/x64/clibs \
    && cd $ZBS \
    && svn export https://github.com/pkulchenko/ZeroBraneStudio/tags/$ZBS_VERSION/lualibs

# remove tools for building the image
RUN apt-get -y remove subversion

ENV NGXDIR /usr/local/openresty/nginx

# create logfiles (why aren't they there already?)
RUN mkdir -p /var/log/nginx && cd /var/log/nginx && touch access.log error.log

# copy tutorial content
COPY ./nginx.conf $NGXDIR/conf/nginx.conf
COPY ./logging.nginx $NGXDIR/conf/logging.nginx
COPY ./lua $NGXDIR/lua

# patch mobdebug
COPY ./2020-challenge.patch /tmp/2020-challenge.patch
RUN patch $ZBS/lualibs/mobdebug/mobdebug.lua /tmp/2020-challenge.patch && rm /tmp/2020-challenge.patch

# copy the CLI wrapper
COPY ./usr-local-bin/resty-cli-wrapper.sh /usr/local/bin/resty-cli-wrapper.sh
RUN chmod a+x /usr/local/bin/resty-cli-wrapper.sh
