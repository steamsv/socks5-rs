# 第一个项目

## 第一小项 位置置顶

依次并排输入框 IP 端口 密码 ，行行对应

输入框下面 生成按钮

## 第二小项 点击后生成对应内容, 每个内容右边有对应复制按钮

### 第一内容 ss链接

根据每行参数生成url，可给软件导入

### 第二内容 生成ss配置文件

有两行就生成2个文件，三行就生成三个文件，并压缩打包zip，名称随机，并显示该zip下载链接，json文件名为 a1 a2 a3依次
```
{
    "server": "0.0.0.0",
    "server_port": 10001,  //输入框端口
    "password": "mypassword",  //输入框密码
    "method": "aes-256-gcm",
    "local_address": "127.0.0.1",
    "local_port": 10001, //输入框端口
    "mode": "tcp_and_udp"
}
```
### 第三内容 生成 supervisor 配置
```
#项目名 根据ss配置数量依次 a1 a2 a3依次
[program:a1]  
#脚本目录
directory=/usr/bin
#脚本执行命令 根据ss配置数量依次 a1 a2 a3依次
command=/usr/bin/ssserver -c a1.json

#supervisor启动的时候是否随着同时启动，默认True
autostart=true
#当程序exit的时候，这个program不会自动重启,默认unexpected，设置子进程挂掉后自动重启的情况，有三个选项，false,unexpected和true。如果为false的时候，无论什么情况下，都不会被重新启动，如果为unexpected，只有当进程的退出码不在下面的exitcodes里面，才会被重启；如果为true将会无条件自动重启
autorestart=true
#这个选项是子进程启动多少秒之后，此时状态如果是running，则我们认为启动成功了。默认值为1
startsecs=1

#脚本运行的用户身份  根据ss配置数量依次 a1 a2 a3依次
user = a1

#日志输出  根据ss配置数量依次 a1 a2 a3依次
stdout_logfile=/root/a1.log
#把stderr重定向到stdout，默认 false
redirect_stderr = true
#stdout日志文件大小，默认 50MB
stdout_logfile_maxbytes = 10MB
#stdout日志文件备份数
stdout_logfile_backups = 20
```

### 第四内容 生成 iptables 规则 数量根据ss配置文件数量，ip为第一输入框，依次

```
iptables -t nat -A POSTROUTING -m owner --uid-owner a1 -j SNAT --to-source 115.115.115.240
iptables -t nat -A POSTROUTING -m owner --uid-owner a2 -j SNAT --to-source 115.115.115.241
iptables -t nat -A POSTROUTING -m owner --uid-owner a3 -j SNAT --to-source 115.115.115.242
```


