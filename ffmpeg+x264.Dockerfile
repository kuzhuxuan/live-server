FROM ubuntu:16.04
MAINTAINER dpy1123


ENV ffmpeg_version 3.2.4 
RUN echo "Asia/Shanghai" > /etc/timezone

#
RUN apt-get update
RUN apt-get install -y bzip2 gcc yasm pkg-config wget

RUN wget https://github.com/FFmpeg/FFmpeg/archive/n$ffmpeg_version.tar.gz
# libx264
RUN wget http://ftp.videolan.org/pub/videolan/x264/snapshots/last_stable_x264.tar.bz2
# mp3lame
#RUN wget https://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz/download


#RUN tar -xvf /ffmpeg-3.2.4.tar.bz2
RUN tar -xvf /n$ffmpeg_version.tar.gz
RUN tar -xvf /last_stable_x264.tar.bz2

RUN mv x264-*-stable x264-stable
WORKDIR /x264-stable
RUN ./configure --enable-static --prefix=/usr/local/
RUN make
RUN make install


#WORKDIR /ffmpeg-3.2.4
WORKDIR /FFmpeg-n$ffmpeg_version
RUN ./configure --enable-gpl --enable-libx264
RUN make
RUN make install