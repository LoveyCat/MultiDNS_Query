#!/bin/bash
PATH=/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

array_dns=(
8.8.8.8 \
8.8.4.4 \
114.114.114.114 \
114.114.115.115 \
208.67.222.222 \
208.67.220.220 \
1.1.1.1 \
209.244.0.3 \
209.244.0.4 \
4.2.2.1 \
4.2.2.2 \
4.2.2.3 \
4.2.2.4 \
223.5.5.5 \
223.6.6.6 \
119.29.29.29 \
119.28.28.28 \
221.13.30.242 \
221.13.28.234 \
211.167.242.34 \
221.130.33.60 \
202.106.196.115 \
219.141.140.10 \
219.150.32.132 \
123.150.150.150 \
125.39.191.252 \
202.99.108.78 \
202.96.197.1 \
61.128.158.38 \
222.87.1.68 \
211.139.5.29 \
)

#read -p "Enter domain:" domain

DNSARRAY=()

for dns in ${array_dns[@]}
	do
	#dig @$dns $domain -t A | grep -v "^$" | grep -v "^;" | grep -v "CNAME" | awk '{print $5}' >> /tmp/$domain | cat /tmp/$domain | uniq | sort -n > /tmp/$domain
	#dig @$dns $1 -t A | grep -v "^$" | grep -v "^;" | grep -v "CNAME" | awk '{print $5}' >> /tmp/$1 | cat /tmp/$1 | uniq | sort -n > /tmp/$1
	dig @$dns $1 -t A +short | egrep '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' >> /tmp/$1 | sort -n /tmp/$1 | uniq > /tmp/$1 

DNSARRAY+=("$!")

done
wait ${DNSARRAY[@]}

cat /tmp/$1

