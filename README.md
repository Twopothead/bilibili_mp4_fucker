## bilibili_mp4_fucker

###  usage:

```sh
bash av_bilibili_videos.sh 26192654/
# bash av_bilibili_videos.sh B站av号(此文件夹从手机缓存导出)26192654/
# 从手机B站缓存拷贝到PC,在B站缓存的av号文件夹的父目录运行。
```

- 用法

![](/home/curie/gitcode/bilibili_mp4_fucker/pics/usage.JPG)

### dependencies:

```sh
sudo apt-get install jq # extract information from json files
sudo apt-get install pv
sudo apt-get install ffmpeg
```

##### before:![](/home/curie/gitcode/bilibili_mp4_fucker/pics/before.JPG)

##### after:

![](/home/curie/gitcode/bilibili_mp4_fucker/pics/after.JPG)

#### success:

![](/home/curie/gitcode/bilibili_mp4_fucker/pics/ok.JPG)

说明：

如何从B站下载到完整的MP4视频？试了一些B站下载工具，速度是硬伤。不如直接在手机Bilibili应用上下载，这样速度快。不过手机缓存里的是碎的~~blv文件~~(其实就是.flv视频文件)，本脚本功能就是从这些琐碎的blv文件中合并提取出完整的MP4，并利用jq自动解析json,从而得到正确的命名。

> 使用方法：从手机B站缓存拷贝到PC,在B站缓存的av号文件夹的**父目录**运行。

bash之后，将自动创建文件夹，合并blv为mp4并放到该文件夹里面，并且有合适的命名.本脚本尤其适合**有很多分集**的**B站课程**视频。



另外说一句，jq解析json真是方便:)![](/home/curie/gitcode/bilibili_mp4_fucker/pics/jq.JPG)

### references : 
- 1.https://github.com/CattenLinger/BilibiliDownloadedFileTidy 
- 2.https://github.com/printempw/printempw.github.io/blob/source/source/_posts/use-ffmpeg-to-concat-flv-videos-downloaded-by-bilibili-client.md
- 3.https://github.com/xsthunder/fix-bilibili-download
	 4.https://stackoverflow.com/questions/255414/why-doesnt-cd-work-in-a-shell-script （#exec bash;#exit;）	

 