# 多DNS查询A记录脚本
这是自己学习shell script过程中写的第一个多DNS查询域名A记录的脚本

功能包含：
- 多DNS同时查询以获取所有的A记录
- 去重仅展示唯一的A记录值
- 输出查询记录到/tmp目录并保存为域名名称

## Usage:
bash dns.sh domain

e.g. bash dns.sh www.youku.com

会尝试不断优化脚本，仅供个人备份参考
