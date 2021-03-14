# ALCPlugFix
* 有朋友反应，XPS 15 7590在电池状态下休眠唤醒后耳机无法发声/爆音，扬声器正常，只能通过重启解决。于是诞生了这个ALCPlugFix XPS 15 7590专用版

### 无法发声的原因

* 通过分析发现，当电池状态下唤醒，插入耳机时，`nid = 0x18 --> result 0x00000000`，这与正常状态下的`nid = 0x18 --> result 0x00000024`不同。

* 执行`alc-verb 0x18 SET_PIN_WIDGET_CONTROL 0x24`后，将状态变更为`nid = 0x18 --> result 0x00000024`，耳机恢复正常输出。

### 插件工作方式

* ALCPlugFix以Daemon方式在后台运行。当检测到耳机状态发生变更时，执行命令，恢复正常状态。

### 插件修改说明

* 本仓库已经对原版本的脚本进行了修改，去除了导致启动禁行的执行代码
* 原来使用的是CodecCommander匹配的hda-verb。因为CodecCommander的功能被合并到AppleALC，现改用alc-verb对声卡状态进行改变
* 同时，由于MacOS Big Sur的特殊，已经将插件从/usr/bin移动到/usr/local/bin。

### 如何使用?
1. 将`ALCPlugFix`同步到本地

    ```sh
    git clone https://github.com/gorquan/ALCPlugFix
    ```

2. 关闭MacOS的SIP保护

3. 打开文件夹`alc_fix`，双击`install双击自动安装.command`，输入密码后即可完成安装

4. 执行重启

5. 当出现电池状态下唤醒耳机无声时，将耳机拔出再插入即可恢复正常

### 如何卸载

1. 打开文件夹`alc_fix`，双击`install双击自动卸载ALCPlugFix.command`，输入密码后即可完成卸载

2. 执行重启

### 如何修改

* 如果你不是XPS 15 7590或你有其他修补方法需要执行修改的，可以访问[@daliansky](https://github.com/daliansky/ALCPlugFix)的仓库，有相应的修改方式。
* 其他参考文章[黑果小兵的部落阁](https://blog.daliansky.net/Use-AppleALC-sound-card-to-drive-the-correct-posture-of-AppleHDA.html#%E8%A7%A3%E5%86%B3%E8%80%B3%E6%9C%BA%E5%88%87%E6%8D%A2%E7%9D%A1%E7%9C%A0%E5%94%A4%E9%86%92%E5%8E%BB%E9%99%A4%E5%BA%95%E5%99%AA%E7%AD%89%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)

### 鸣谢
* [@goodwin](https://github.com/goodwin/ALCPlugFix) ALCPlugFix大本营
* [@daliansky](https://github.com/daliansky/ALCPlugFix)
* [@illusion899](https://github.com/illusion899) 这位哥们给我提供了许多信息




