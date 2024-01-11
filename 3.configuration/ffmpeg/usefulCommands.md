## make simple fragmented videos 
```
ffmpeg -i input_video.mp4 -c:v libx264 -c:a aac -f hls -hls_time 10 -hls_list_size 0 -hls_segment_filename output_%03d.ts output.m3u8
```

