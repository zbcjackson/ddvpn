# DDVPN
ddvpn是一个用于dd-wrt路由器的脚本，受chnroute和autoddvpn启发而来，可在访问国内IP使用正常线路，访问国外IP使用VPN线路。

目前仅支持dd-wrt路由器和PPTP的VPN。

##设置方式：
DDWRT必须启动JFFS：在dd-wrt的Administration->Management下面找到JFFS支持，并打开。

```bash
# mkdir /jffs/pptp
# cd /jffs/pptp
# wget http://autoddvpn.googlecode.com/svn/trunk/grace.d/vpnup.sh
# wget http://autoddvpn.googlecode.com/svn/trunk/grace.d/vpndown.sh
# wget http://autoddvpn.googlecode.com/svn/trunk/pptp/jffs/run.sh
# chmod a+x *.sh
# nvram set rc_startup='/jffs/pptp/run.sh'
# nvram commit
```

##别忘了设置PPTP Client
* PPTP服务器请使用IP地址，否则容易断线
* MPPE Encryption里面输入mppe required,no40,no56,stateless
* 请正确输入Remote Subnet与Remote Subnet Mask，否则影响路由表正常工作

