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
### Folders in docker img:  
/live/hls for hls streaming  
/live/rec for record  
/live/log for log storage  
### 由于存在延迟，结束推流后，record视频的时长会少几秒(取决于延迟大小)。  

## url
本例中  
push url： rtmp://localhost/live/app?key=dpy1123  
pull url： rtmp://localhost/live/app  
hls可在web页 http://localhost:8080/ 中观看，输入streamName为app 
