## live-server

## how to use

```bash
# build ffmpeg
cp ffmpeg+x264.Dockerfile Dockerfile
docker build -t dd-ffmpeg:0.1 .
# build nginx
cp nginx+rtmp.Dockerfile Dockerfile
docker build -t dd-nginx-rtmp:0.1 .
# docker run 
docker run -it -p 1935:1935 -p 8080:8080 --name=live_server dd-nginx-rtmp:0.1 /bin/bash 
nginx
```

## note
Folders in docker img  
/live/hls for hls streaming  
/live/rec for record  
/live/log for log storage  