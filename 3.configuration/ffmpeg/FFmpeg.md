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

## ffmpeg tools

- ffmpeg

- ffplay

- ffprobe

## ffprobe

```
ffprobe -v error seagull.mp4 // dont show any output


ffprobe -v error seagull.mp4 -show_format  // shows all the format



ffprobe -v error seagull.mp4 -show_stream // shows only all the stream

ffprobe -v error seagull.mp4 -show_stream -print_format json



ffprobe -v error seagull.mp4 -show_stream \
 -print_format json -select_stream v


ffprobe -v error seagull.mp4 -select_streams v show_entries stream=codec_name \
 -print_format default=noprint_wrappers=1
```

## ffplay

```
ffplay -v error bullfinch.mp4

ffplay -v error bullfinch.mp4 -x 600 -y 600


ffplay -v error bullfinch.mp4 -x 600 -y 600 -noborder


ffplay -v error bullfinch.mp4 -x 600 -y 600 -noborder -top 0 -left 0


ffplay -v error bullfinch.mp4 -x 600 -y 600 -noborder -fs  // full screen


ffplay -v error bullfinch.mp4 -x 600 -y 600 -noborder -an  // no sound


ffplay -v error bullfinch.mp4 -x 600 -y 600 -noborder -vn // no video only audio
```

space - pause 

m - mute 

f- full screen

volume , 0 to 9 

/  - volume down

`*`  - volume up
w - cycle mode

s  frame step

left , right   - 10 sec forward /backward

esc - quit

### Codec

- encoding and decoding 

- can mean a format or specification or software library/plugin

codec example 

- video codec 
  
  - h.264 
  
  - h.265
  
  - VP9 - google
  
  - Prores - apple
  
  - DNxHD 

- audio codec
  
  - PCM
  
  - AAC
  
  - MP3

### container

- package/wrapper for media essence

- file format 

- How the media data is organized inside a file

#### video cointainers

- MP4

- MXF   - used in broadcast 

- QT/MOV

- MKV 

#### audio container

- WAV 

- M4A

## Transcoding

- from one codec to another 

- example : Prores to H.264

for: quality , compression, Storage, Editing/preview/streaming , consuming application

- thumbnail generation

- frame rate conversion

- Bitrate conversion 

- GOP size conversion

- Overlay  - logo, watermark etc

- subtiles

- Timecode - change timecode ,burn in timecode 

- convert video resulation

- audio volume adjustment

- audio mix

- audio extraction

- audio resampling 

- waveform from audio

- apply effect on video and audio
