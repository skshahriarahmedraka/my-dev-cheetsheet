ffprobe command 

ffprobe -i moon.mp4 -show_format 
ffprobe -i moon.mp4 -show_streams
ffprobe -i moon.mp4 -show_streams -print_format xml

ffprobe -i moon.mp4 -show_streams -print_format xml -v error 

ffprobe -i moon.mp4 -show_streams -print_format json

ffprobe -i moon.mp4 -show_format -show_streams -print_format json 

ffprobe  -show_format -show_streams -print_format json -v error audio.flac

ffprobe  -show_format -show_streams -print_format json -v error image.jpg




