#!/bin/bash


path=${0%/*}
sudo launchctl remove /Library/LaunchAgents/good.win.ALCPlugFix.plist
echo "移除Daemon任务成功"
sudo rm -rf /Library/LaunchAgents/good.win.ALCPlugFix.plist
echo "删除plist文件成功"
sudo rm -rf /usr/local/bin/ALCPlugFix
echo "删除ALCPlugFix成功"
sudo rm -rf /usr/local/bin/alc-verb
echo "删除alc-verb成功"
echo "卸载ALCPlugFix守护进程完成！"
bash read -p "按任何键退出"