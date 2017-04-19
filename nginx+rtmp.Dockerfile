FROM dd-ffmpeg:0.1
MAINTAINER dpy1123

RUN echo "Asia/Shanghai" > /etc/timezone
ENV nginx_version 1.12.0

RUN apt-get update
RUN apt-get install -y git libpcre3-dev libaio1 openssl libssl-dev

WORKDIR /
# Download nginx and nginx-rtmp-module
RUN wget http://nginx.org/download/nginx-$nginx_version.tar.gz
RUN git clone https://github.com/arut/nginx-rtmp-module.git

# Compile nginx with nginx-rtmp and libaio
RUN tar -xvf /nginx-$nginx_version.tar.gz
WORKDIR /nginx-$nginx_version
COPY nginx.conf /nginx-$nginx_version/conf/nginx.conf
RUN ./configure --with-file-aio --add-module=/nginx-rtmp-module
RUN make
RUN make install

# Link nginx
RUN ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx

WORKDIR /live
RUN mkdir /live/hls /live/conf /live/rec /live/log /live/html

COPY http.conf /live/conf/http.conf
COPY rtmp.conf /live/conf/rtmp.conf
COPY index.html /live/html/index.html

EXPOSE 1935 
EXPOSE 8080
