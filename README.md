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
# in docker container
nginx 
nohup nodejs auth/auth_server.js > log/auth_server.log 2>&1 &
```

## note
Folders in docker img  
/live/hls for hls streaming  
/live/rec for record  
/live/log for log storage  
由于存在延迟，结束推流后，record视频的时长会少几秒(取决于延迟大小)。  

## url
push rtmp://host/live/StreamName  
pull rtmp://host/live/StreamName  
hls http://host:8080/hls/StreamName.m3u8  
