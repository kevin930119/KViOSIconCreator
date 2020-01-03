#!/bin/bash

# 请根据实际情况修改以下默认值
# 例如，只需要生成iPhone的图标，那么只需要将iPhoneValid修改为1，其他值修改为0，然后运行此脚本即可
# 是否允许iPhone
iPhoneValid=1
# 是否允许iPad
iPadValid=0
# 是否允许AppleWatch
AppleWatchValid=0
# 是否允许CarPlay
CarPlayValid=0
# 是否允许Mac
MacValid=0

# 获取路径
currentDir=$(pwd)
dirIcon="${currentDir}/icon"

# 检查icon文件夹
if [[ ! -d ${dirIcon} ]]; then
echo "/icon 文件夹不存在"
exit 1
fi

# 检查icon图片数
files=$(ls ${dirIcon})
length=${#files[*]}
if [ $length -eq 1 ]; then
    # 获取原icon路径
    fileName=$files
    filePath="${dirIcon}/${fileName}"
    
    # 配置iPhone尺寸
    if [ $iPhoneValid -eq 1 ]; then
        fileNames_iPhone=("app_icon_notification@2x.png" "app_icon_notification@3x.png" "app_icon_settings@2x.png" "app_icon_settings@3x.png" "app_icon_spotlight@2x.png" "app_icon_spotlight@3x.png" "app_icon_app@2x.png" "app_icon_app@3x.png")
        fileSizes_iPhone=(40 60 58 87 80 120 120 180)
        fileNames_iPhone_length=${#fileNames_iPhone[*]}
        for((i=0;i<$fileNames_iPhone_length;i++));
        do
            width=${fileSizes_iPhone[$i]}
            name=${fileNames_iPhone[$i]}
            # 拼接输出路径
            outputPath="${dirIcon}/${name}"
            # 拷贝图片
            sips -z $width $width $filePath --out $outputPath
        done
    fi
    
    # 配置iPad尺寸
    if [ $iPadValid -eq 1 ]; then
        fileNames_iPad=("ipad_app_icon_notification.png" "ipad_app_icon_notification@2x.png" "ipad_app_icon_settings.png" "ipad_app_icon_settings@2x.png" "ipad_app_icon_spotlight.png" "ipad_app_icon_spotlight@2x.png" "ipad_app_icon_app.png" "ipad_app_icon_app@2x.png" "ipad_pro_app_icon_app@2x.png")
        fileSizes_iPad=(20 40 29 58 40 80 76 152 167)
        fileNames_iPad_length=${#fileNames_iPad[*]}
        for((i=0;i<$fileNames_iPad_length;i++));
        do
            width=${fileSizes_iPad[$i]}
            name=${fileNames_iPad[$i]}
            # 拼接输出路径
            outputPath="${dirIcon}/${name}"
            # 拷贝图片
            sips -z $width $width $filePath --out $outputPath
        done
    fi
    
    # 配置AppleWatchValid尺寸
    if [ $AppleWatchValid -eq 1 ]; then
        fileNames_AppleWatch=("AppleWatch_app_icon_notification_38mm@2x.png" "AppleWatch_app_icon_notification_40_42mm@2x.png" "AppleWatch_app_icon_settings_notification_44mm@2x.png" "AppleWatch_app_icon_settings_notification_44mm@3x.png" "AppleWatch_app_icon_home_screen_38mm@2x.png" "AppleWatch_app_icon_home_screen_40_42mm@2x.png" "AppleWatch_app_icon_home_screen_44mm@2x.png" "AppleWatch_app_icon_short_look_38mm@2x.png" "AppleWatch_app_icon_short_look_40_42mm@2x.png" "AppleWatch_app_icon_short_look_44mm@2x.png" "AppleWatch_app_icon_appstore.png")
        fileSizes_AppleWatch=(48 55 58 87 80 88 100 172 196 216 1024)
        fileNames_AppleWatch_length=${#fileNames_AppleWatch[*]}
        for((i=0;i<$fileNames_AppleWatch_length;i++));
        do
            width=${fileSizes_AppleWatch[$i]}
            name=${fileNames_AppleWatch[$i]}
            # 拼接输出路径
            outputPath="${dirIcon}/${name}"
            # 拷贝图片
            sips -z $width $width $filePath --out $outputPath
        done
    fi
    
    # 配置CarPlay尺寸
    if [ $CarPlayValid -eq 1 ]; then
        fileNames_CarPlay=("CarPlay_app_icon_app@2x.png" "CarPlay_app_icon_app@3x.png")
        fileSizes_CarPlay=(120 180)
        fileNames_CarPlay_length=${#fileNames_CarPlay[*]}
        for((i=0;i<$fileNames_CarPlay_length;i++));
        do
            width=${fileSizes_CarPlay[$i]}
            name=${fileNames_CarPlay[$i]}
            # 拼接输出路径
            outputPath="${dirIcon}/${name}"
            # 拷贝图片
            sips -z $width $width $filePath --out $outputPath
        done
    fi
    
    # 配置Mac尺寸
    if [ $MacValid -eq 1 ]; then
        fileNames_Mac=("Mac_app_icon_16.png" "Mac_app_icon_16@2x.png" "Mac_app_icon_32.png" "Mac_app_icon_32@2x.png" "Mac_app_icon_128.png" "Mac_app_icon_128@2x.png" "Mac_app_icon_256.png" "Mac_app_icon_256@2x.png" "Mac_app_icon_512.png" "Mac_app_icon_appstore@2x.png")
        fileSizes_Mac=(16 32 32 64 128 256 256 512 512 1024)
        fileNames_Mac_length=${#fileNames_Mac[*]}
        for((i=0;i<$fileNames_Mac_length;i++));
        do
            width=${fileSizes_Mac[$i]}
            name=${fileNames_Mac[$i]}
            # 拼接输出路径
            outputPath="${dirIcon}/${name}"
            # 拷贝图片
            sips -z $width $width $filePath --out $outputPath
        done
    fi
    
else
    echo "icon图片数量非法"
fi
