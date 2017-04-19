## live-server

## setup
```bash
# build ffmpeg
cp ffmpeg+x264.Dockerfile Dockerfile
docker build -t dd-ffmpeg:0.1 .
# build nginx
cp nginx+rtmp.Dockerfile Dockerfile
docker build -t dd-nginx-rtmp:0.1 .
# docker run 
docker run -it -p 1935:1935 -p 8080:8080 --name=live_server -v ~/live/rec:/live/rec dd-nginx-rtmp:0.1 /bin/bash 
nginx
```

## note
Folders in docker img  
/live/hls for hls streaming  
/live/rec for record  
/live/log for log storage  

## url
push rtmp://host/live/StreamName  
pull rtmp://host/live/StreamName  
hls http://host:8080/hls/StreamName.m3u8  
