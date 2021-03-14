#!/bin/bash


path=${0%/*}
sudo cp -a "$path/alc-verb" /usr/local/bin
sudo chmod 755 /usr/local/bin/alc-verb
sudo chown root:wheel /usr/local/bin/alc-verb
echo "alc-verb安装成功"
sudo cp -a "$path/ALCPlugFix" /usr/local/bin
sudo chmod 755 /usr/local/bin/ALCPlugFix
sudo chown root:wheel /usr/local/bin/ALCPlugFix
echo "ALCPlugFix安装成功"
sudo cp -a "$path/good.win.ALCPlugFix.plist" /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo chown root:wheel /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo launchctl load /Library/LaunchAgents/good.win.ALCPlugFix.plist
echo "plist安装成功"
echo "安装ALCPlugFix守护进程完成！"
bash read -p "按任何键退出"