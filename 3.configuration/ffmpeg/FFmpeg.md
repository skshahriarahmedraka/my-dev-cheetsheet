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

### choosing a codec

- compression

- quality vs size 

- stream vs post-production

- target application

- compatibility

## encoding options

- global 
  
  - profile 
  
  - bitrate 
  
  - GOP size 

- Private 
  
  - x264 - params

```
ffprobe -v error bullfinch.mov -select_streams v -show_entries \
 stream=codec_name -print_format default=noprint_wrappers=1 
# codec_name=prores 

ffmeg -v error -y -i bullfinch.mov trascoded.mxf 

ffprobe -v error transcoded.mxf -select_streams v -show_entries \
 stream=codec_name -print_format default=noprint_wrappers=1 
# codec_name=h264 

ffmpeg -v error -y  -i bullfinch.mov -vcodec libx264 transcoded.mxf 

ffmprove -v error transcoded.mxf -select_streams v -show_entries \
 stream=codec_name -print_format default=nonprint_wrappers=1 
# codec_name=h264 

ffmpeg -encoders 

ffmpeg -v error -y -i bullfinch.mov -vcodec libvpx-vp9 transcoded.mxf 

## audio codec
ffmpeg -v error -y -i bullfinxh.mov -vcodec libvpx-vp9 -acodec libmp3lame transcode.mp4


ffmprobe -v error transcode.mp4 -selct_stream a  -show_entries stream=codec_name
-print_format default=noprint_wrappers=1
```

## H.264 /AVC

encoder library - libx264

profile - baseline,main,high

rate control 

    - CRF : contrant quality, variable bitrate

    - Two-pass ABR: Variable quality, constant bitrate

CRF - 0 to 51

check a video bitrate 

```
ffprobe -v error bullfinch.mov -select_streams v -show_entries \
 stream=codec_name,bit_rate -print_format default=noprint_wrappers=1
# codec_name=h264
# bitrate=
```

2 pass encoding 

```
ffmpeg -v error -y -i bullfinch.mov -vcodec libx264 -b:v 2M -pass 1 -f null /dev/null

ffmpeg -v error -y -i bullfinch.mov -vcodec libx264 -b:v 2M -pass 2 transcoded.mp4

ffprobe -v error transcoded.mp4 -selet_streams v -show_entries \
 stream=codec_name,bitrate -print_format default=noprint_wrappers=1
# codec_name=h264
# bit_rate=
```

## preset: speed vs compression


## trimming 

```
ffmpeg -y -v error -i nature.mp4 -ss 00:03:55.000 -to 240.0 squirrel.mp4 
```

## concat multiple file 

**list.txt**
```
file 'bull.mp4'
file 'sea.mp4'
file 'squirrel.mp4'
```
```
ffmpeg -y -v error -f concat -i list.txt merged.mp4 
```

## thumbnail 

make first frame as poster frame 
```
ffmpeg -v error -i bullfinch.mp4 -vframes 1 bullfinch_poster.jpg
ffmpeg -v error -i bullfinch.mp4 -vframes 1  vf scale=320:180   bullfinch_poster_320.jpg

ffmpeg -v error -i bullfinch.mp4 -ss 5 -vframes 1  bullfinch_poster.jpg
```
see the width andheight 
```
ffprobe fullfinch.jpg -v error -select_stream v -show_entries stream=width,height


```

generate multiple thumbnail 
```
  
ffmpeg -v error -i bullfinch.mp4 -vf fps=1,scale=320:180 bullfinch-thumbnail-%02d.jpg 

```
## Scaling 

```
ffplay -v error cow_4k.mp4 -an 

ffprobe cow_4.mp4 -v error -select_streams v -show_entries stream=width,height

```
scale 1280x720
```
ffmpeg -v error -y -i cow_4k.mp4 -vf scale=1280:720 cow_720.mp4

ffprobe cow_720p.mp4 -v error -select_streams v -show_entries stream=width,height

```

```

ffplay -v error -y -i cow_4k.mp4 -vf scale=640:480 cow_480.mp4 

ffmpeg -v error -y -i cow_4k.mp4 -vf scale=-1:480 cow_480_aspect_preserved.mp4 
// this can give error , because ratio cant be odd number  


ffmpeg -v error -y -i cow_4k.mp4 -vf scale=-2:480 cow_480_aspect_preserved.mp4 

ffprobe -v error cow_480_aspect_forced.mp4 -v error -selct_streams v -show_entries stream=width,height
```

```
ffmpeg -v error -y -i cow_4k.mp4 -vf "scale=640:480:force_original_aspec_ratio=decrease,pad=640:480:(ow-iw)/2:(oh-ih)/2" cow_480_aspect_fored_and_padded.mp4

```



