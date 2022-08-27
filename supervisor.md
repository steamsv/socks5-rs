# install

```
dnf install epel-release -y
dnf install supervisor -y
systemctl enable supervisord
systemctl start supervisord
```

```
yum install iptables-services -y  #安装iptables
systemctl start iptables  #启动
systemctl enable iptables  #开机启动
```
```
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 10000:50000 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 10000:50000 -j ACCEPT
```
```
iptables -t nat -A POSTROUTING -m owner --uid-owner a1 -j SNAT --to-source 103.162.98.55
```
```
#项目名
[program:a]
#脚本目录
directory=/usr/bin
#脚本执行命令
command=/usr/bin/socks5-rs -b 127.0.0.1 -p 10001

#supervisor启动的时候是否随着同时启动，默认True
autostart=true
#当程序exit的时候，这个program不会自动重启,默认unexpected，设置子进程挂掉后自动重启的情况，有三个选项，false,unexpected和true。如果为false的时候，无论什么情况下，都不会被重新启动，如果为unexpected，只有当进程的退出码不在下面的exitcodes里面，才会被重启；如果为true将会无条件自动重启
autorestart=false
#这个选项是子进程启动多少秒之后，此时状态如果是running，则我们认为启动成功了。默认值为1
startsecs=1

#脚本运行的用户身份 
user = a

#日志输出 
stdout_logfile=/root/s5.log
#把stderr重定向到stdout，默认 false
redirect_stderr = true
#stdout日志文件大小，默认 50MB
stdout_logfile_maxbytes = 10MB
#stdout日志文件备份数
stdout_logfile_backups = 20
```

```
supervisorctl status        //查看所有进程的状态
 
supervisord                 //启动supervisord
supervisorctl start all       //启动supervisord管理的所有进程
supervisorctl stop all        //停止supervisord管理的所有进程
supervisorctl restart all    // 重启所有进程
supervisorctl stop zedis       //停止zedis, name为[program:xx]中的xx
supervisorctl start zedis      //启动zedis
supervisorctl restart zedis      //重启zedis
supervisorctl update        //配置文件修改后使用该命令加载新的配置
supervisorctl reload        //重新加载配置文件并启动
supervisorctl shutdown     //停止supervisord
```
