#!/bin/bash
# usage : bash av_bilibili_videos.sh 26192654/
# bash av_bilibili_videos.sh B站av号(此文件夹从手机缓存导出)26192654/
workdir=`pwd`; echo "Current working dir : $workdir";
sourcedir="${workdir}/${1}"; echo "Source dir is : $sourcedir";
for dir in `ls -F $sourcedir | grep "/$"`; do
	videoIndex=`jq .page_data.page ${sourcedir}/${dir}/entry.json | tr -d \"`;
	videoTitle=`jq .page_data.part  ${sourcedir}/${dir}/entry.json | tr -d \"`;
	videoSerial=`jq .title ${sourcedir}/${dir}/entry.json | tr -d \"`;
	echo "Sub-dir : ${dir}";
	echo " |- The ${videoIndex} video of ${videoSerial} : ${videoTitle}";
	videoName="${videoIndex}.${videoTitle}-${videoSerial}.mp4";
	danmu_xml_Name="${videoIndex}.${videoTitle}-${videoSerial}_danmaku.xml";
	if [ ! -d "${workdir}/${videoSerial}" ]; then mkdir "${workdir}/${videoSerial}"; echo "Serial directory created : ${workdir}/${videoSerial}"; fi;
	_dir=`ls -F $sourcedir$dir | grep "/$"`;
	# videoFileList=(`find ${sourcedir}${dir}${_dir} -name "*.mp4"`);
	echo " |- Found ${#videoFileList[@]} video file(s) in directory";
	echo "directory: ${sourcedir}${dir}${_dir}"
	cp ./blv_s_2_mp4.txt ${sourcedir}${dir}${_dir} 
	cd ${sourcedir}${dir}${_dir} && ls && bash blv_s_2_mp4.txt && mv ../output.mp4 "../../../${videoSerial}/${videoName}" && mv ../danmaku.xml "../../../${videoSerial}/${danmu_xml_Name}";
done;

#------------------更新------------------
# 新增弹幕danmaku.xml导出功能，danmaku.xml将被命名为与mp4同名的弹幕xml文件
# 将合并后的视频和 同名danmaku.xml 弹幕文件一起拖入「BiliLocal」等本地弹幕播放器后就可以观看了，
# 附「BiliLocal」: 
# 		win 地址：https://github.com/AncientLysine/BiliLocal 
#		Mac & linux : https://github.com/asahui/BiliLocal-OSX

# references : 
# 1.https://github.com/CattenLinger/BilibiliDownloadedFileTidy 
# 2.https://github.com/printempw/printempw.github.io/blob/source/source/_posts/use-ffmpeg-to-concat-flv-videos-downloaded-by-bilibili-client.md
# 3.https://github.com/xsthunder/fix-bilibili-download
# 4.https://stackoverflow.com/questions/255414/why-doesnt-cd-work-in-a-shell-script #exec bash;#exit;	
