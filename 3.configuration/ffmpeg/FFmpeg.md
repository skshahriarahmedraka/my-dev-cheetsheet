# FFmpeg



### get info of file

```
ffmpeg -i "sampleVideo.mp4"
```



### convert video (lossy compression)

```
ffmpeg -i "sampleVideo.mp4"  "output.avi"
```



### Copy only video

```
ffmpeg -i "sampleVideo.mp4" -c:v copy -an "Sample_onlyVideo.mkv"
```



### Copy only audio

```
ffmpeg -i "sampleVideo.mp4" -c:a copy -vn "Sample_onlyAudio.m4a"
```



### Combine Audio and Video

```
ffmpeg  -i "Sample_onlyVideo.mkv" -i "Sample_onlyAudio.m4a" -c:v copy \
 -c:a copy "SampleVideo_Output.mkv"
```








