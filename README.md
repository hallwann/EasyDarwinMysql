# UPARE开源流媒体服务器


## 主要功能特点

- 基于Golang和[EasyDarwin](https://github.com/EasyDarwin/EasyDarwin/releases)开发维护；
- 支持Windows、Linux、macOS平台；
- 支持RTSP推流分发（推模式转发）；
- 支持RTSP拉流分发（拉模式转发）；
- 支持mysql数据库
- 支持直播mid授权和直播时间段校验，可与现有直播平台无缝对接
- 服务端录像 参考:https://blog.csdn.net/jyt0551/article/details/84189498
- 服务端录像检索与回放 参考:https://blog.csdn.net/jyt0551/article/details/84189498
- 关键帧缓存；
- 秒开画面；
- Web后台管理；
- 分布式负载均衡；


## 安装部署

- [下载解压 release 包](https://github.com/howwant/EasyDarwinMysql/releases/download/8.2.1/release.zip)

- 配置upareserver.ini中的mysql信息

- 将mysql.sql导入数据库

- 直接运行(Windows)

    UPAREserver.exe
    
    以 `Ctrl + C` 停止服务

- 以服务启动(Windows)

    start.sh
    
    以stop.sh 卸载UPAREserver 服务

- 直接运行(Linux/macOS)

  	cd EasyDarwin
  	chmod +x UPAREserver 
  	./UPAREserver
  	# Ctrl + C

- 以服务启动(Linux/macOS)

		cd EasyDarwin
		./start.sh
		# ./stop.sh

- 查看界面
	
	打开浏览器输入 [http://localhost:10008](http://localhost:10008), 进入控制页面,默认用户名密码是admin/admin

- 测试推流

	ffmpeg -re -i C:\Users\Administrator\Videos\test.mkv -rtsp_transport tcp -vcodec h264 -f rtsp rtsp://localhost/test

	ffmpeg -re -i C:\Users\Administrator\Videos\test.mkv -rtsp_transport udp -vcodec h264 -f rtsp rtsp://localhost/test
			

- 测试播放

	ffplay -rtsp_transport tcp rtsp://localhost/test

	ffplay rtsp://localhost/test 
	
- 数据库说明
	
	hw_live_list 中的mid是自行开发的直播平台生成的播放列表唯一标识，rtsp地址提交的url中必须与mid一致如 rtsp://192.168.194.129:554/**5f9ae659d355707f78f1e97d910e371c**，否则返回403授权失败，endtime必须大于服务器时间，否则返回401 time up
	
	

## 二次开发

### 准备工具

        # go tools
        go get -u -v github.com/kardianos/govendor
        go get -u -v github.com/penggy/gobuild
    
        # npm tools
        npm i -g apidoc
        npm i -g rimraf


### 编译命令

- 获取代码

        cd $GOPATH/src/github.com
        mkdir EasyDarwin && cd EasyDarwin
        git clone https://github.com/howwant/EasyDarwinMysql.git --depth=1 EasyDarwin
        cd EasyDarwin

- 以开发模式运行

        npm run dev

- 以开发模式运行前端 Run as dev mode

        npm run dev:www       

- 编译前端  Build www

        cd web_src && npm i
        cd ..
        npm run build:www

- 编译 Windows 版本 Build windows version

        npm run build:win

- 编译 Linux/macOS 版本 (在 bash 环境下执行) Build linux/macOS version

        npm run build:lin       

- 清理编译文件 Clean

        npm run clean 

- 打包 Pack

        # install pack
        npm i -g @penggy/pack
        
        # for windows
        npm run build:win
        pack zip
        
        # for linux/macOS
        npm run build:lin
        pack tar
        
        # for clean
        pack clean


