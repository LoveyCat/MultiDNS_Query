#!/bin/bash
PATH=/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DNS1="8.8.8.8"
DNS2="8.8.4.4"
DNS3="114.114.114.114"
DNS4="114.114.115.115"
DNS5="208.67.222.222"
DNS6="208.67.220.220"
DNS7="1.1.1.1"
DNS8="209.244.0.3"
DNS9="209.244.0.4"
DNS10="4.2.2.1"
DNS11="4.2.2.2"
DNS12="4.2.2.3"
DNS13="4.2.2.4"
DNS14="223.5.5.5"
DNS15="223.6.6.6"
DNS16="119.29.29.29"
DNS17="119.28.28.28"
DNS18="221.13.30.242"
DNS19="221.13.28.234"
DNS20="211.167.242.34"
DNS21="221.130.33.60"
DNS22="202.106.196.115"
DNS23="219.141.140.10"
DNS24="219.150.32.132"
DNS25="123.150.150.150"
DNS26="125.39.191.252"
DNS27="202.99.108.78"
DNS28="202.96.197.1"
DNS29="61.128.158.38"
DNS30="222.87.1.68"
DNS31="211.139.5.29"

read -p "Enter domain:" domain
domain=$domain

DNSARRAY=()

for DNS in $DNS1 $DNS2 $DNS3 $DNS4 $DNS5 $DNS6 $DNS7 $DNS8 $DNS9 $DNS10 $DNS11 $DNS12 $DNS13 $DNS14 $DNS15 $DNS16 $DNS17 $DNS18 $DNS19 $DNS20 $DNS21 $DNS22 $DNS23 $DNS24 $DNS25 $DNS26 $DNS27 $DNS28 $DNS29 $DNS30 $DNS31    

do

dig @$DNS $domain -t A | grep -v "^$" | grep -v "^;" | grep -v "CNAME" | awk '{print $5}' >> /tmp/$domain | cat /tmp/$domain | uniq | sort -n > /tmp/$domain


DNSARRAY+=("$!")
done
wait ${DNSARRAY[@]}

