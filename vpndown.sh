#!/bin/sh

set -x
export PATH="/bin:/sbin:/usr/sbin:/usr/bin"

OLDGW=$(nvram get wan_gateway)
PPTPSRV=$(nvram get pptpd_client_srvip)
VPNGW=$(nvram get pptp_gw)

route -n | awk '$NF ~ /vlan2/{print $1,$3}' | while read x y
do
  route del -net $x netmask $y
done

route del default gw $VPNGW
route add default gw $OLDGW

