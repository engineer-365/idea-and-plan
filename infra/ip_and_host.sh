#!/bin/bash

# 
#  MIT License
# 
#  Copyright (c) 2020 engineer365.org
# 
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
# 
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
# 
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

set -x

etc_hosts_file=$infra_dir/etc_hosts
rm -f $etc_hosts_file



# ip and host
export monitor_vip="192.168.50.10"
export monitor_vhost="monitor.${org}.test"
echo "${monitor_vip}    ${monitor_vhost}" >> $etc_hosts_file
export monitor1_ip="192.168.50.11"
export monitor1_host="monitor1.${org}.test"
echo "${monitor1_ip}    ${monitor1_host}" >> $etc_hosts_file

export store_vip="192.168.50.20"
export store_vhost="store.${org}.test"
echo "${store_vip}    ${store_vhost}" >> $etc_hosts_file
export store1_ip="192.168.50.21"
export store1_host="store1.${org}.test"
echo "${store1_ip}    ${store1_host}" >> $etc_hosts_file
export store2_ip="192.168.50.22"
export store2_host="store2.${org}.test"
echo "${store2_ip}    ${store2_host}" >> $etc_hosts_file
export store3_ip="192.168.50.23"
export store3_host="store3.${org}.test"
echo "${store3_ip}    ${store3_host}" >> $etc_hosts_file
export store4_ip="192.168.50.24"
export store4_host="store4.${org}.test"
echo "${store4_ip}    ${store4_host}" >> $etc_hosts_file
export store5_ip="192.168.50.25"
export store5_host="store5.${org}.test"
echo "${store5_ip}    ${store5_host}" >> $etc_hosts_file

export proxy_vip="192.168.50.100"
export proxy_vhost="proxy.${org}.test"
echo "${proxy_vip}    ${proxy_vhost}" >> $etc_hosts_file
export proxy1_ip="192.168.50.101"
export proxy1_host="proxy1.${org}.test"
echo "${proxy1_ip}    ${proxy1_host}" >> $etc_hosts_file
export proxy2_ip="192.168.50.102"
export proxy2_host="proxy2.${org}.test"
echo "${proxy2_ip}    ${proxy2_host}" >> $etc_hosts_file

export builder_vip="192.168.50.120"
export builder_vhost="builder.${org}.test"
echo "${builder_vip}    ${builder_vhost}" >> $etc_hosts_file
export builder1_ip="192.168.50.121"
export builder1_host="builder1.${org}.test"
echo "${builder1_ip}    ${builder1_host}" >> $etc_hosts_file
export builder2_ip="192.168.50.122"
export builder2_host="builder2.${org}.test"
echo "${builder2_ip}    ${builder2_host}" >> $etc_hosts_file

export k8s_master_vip="192.168.50.150"
export k8s_master_vhost="k8s-master.${org}.test"
echo "${k8s_master_vip}    ${k8s_master_vhost}" >> $etc_hosts_file
export k8s_master1_ip="192.168.50.151"
export k8s_master1_host="k8s-master1.${org}.test"
echo "${k8s_master1_ip}    ${k8s_master1_host}" >> $etc_hosts_file
export k8s_master2_ip="192.168.50.152"
export k8s_master2_host="k8s-master2.${org}.test"
echo "${k8s_master2_ip}    ${k8s_master2_host}" >> $etc_hosts_file

export k8s_node1_ip="192.168.50.171"
export k8s_node1_host="k8s-node1.${org}.test"
echo "${k8s_node1_ip}    ${k8s_node1_host}" >> $etc_hosts_file
export k8s_node2_ip="192.168.50.172"
export k8s_node2_host="k8s-node2.${org}.test"
echo "${k8s_node2_ip}    ${k8s_node2_host}" >> $etc_hosts_file
export k8s_node3_ip="192.168.50.173"
export k8s_node3_host="k8s-node3.${org}.test"
echo "${k8s_node3_ip}    ${k8s_node3_host}" >> $etc_hosts_file
export k8s_node4_ip="192.168.50.174"
export k8s_node4_host="k8s-node4.${org}.test"
echo "${k8s_node4_ip}    ${k8s_node4_host}" >> $etc_hosts_file
export k8s_node5_ip="192.168.50.175"
export k8s_node5_host="k8s-node5.${org}.test"
echo "${k8s_node5_ip}    ${k8s_node5_host}" >> $etc_hosts_file

# aliases
export mysql_router_vip=$proxy_vip
export mysql_router_vhost="mysql-router.${org}.test"
echo "${mysql_router_vip}    ${mysql_router_vhost}" >> $etc_hosts_file
export mysql_router1_ip=$proxy1_ip
export mysql_router1_host="mysql-router1.${org}.test"
echo "${mysql_router1_ip}    ${mysql_router1_host}" >> $etc_hosts_file
export mysql_router2_ip=$proxy2_ip
export mysql_router2_host="mysql-router2.${org}.test"
echo "${mysql_router2_ip}    ${mysql_router2_host}" >> $etc_hosts_file
export mysql_master1_ip=$store1_ip
export mysql_master1_host="mysql-master1.${org}.test"
echo "${mysql_master1_ip}    ${mysql_master1_host}" >> $etc_hosts_file
export mysql_master2_ip=$store2_ip
export mysql_master2_host="mysql-master2.${org}.test"
echo "${mysql_master2_ip}    ${mysql_master2_host}" >> $etc_hosts_file
export mysql_slave1_ip=$store3_ip
export mysql_slave1_host="mysql-slave1.${org}.test"
echo "${mysql_slave1_ip}    ${mysql_slave1_host}" >> $etc_hosts_file
export mysql_slave2_ip=$store4_ip
export mysql_slave2_host="mysql-slave2.${org}.test"
echo "${mysql_slave2_ip}    ${mysql_slave2_host}" >> $etc_hosts_file
export mysql_slave3_ip=$store5_ip
export mysql_slave3_host="mysql-slave3.${org}.test"
echo "${mysql_slave3_ip}    ${mysql_slave3_host}" >> $etc_hosts_file


export mongodb_router_vip=$proxy_vip
export mongodb_router_vhost="mongodb-router.${org}.test"
echo "${mongodb_router_vip}    ${mongodb_router_vhost}" >> $etc_hosts_file
export mongodb_router1_ip=$proxy1_ip
export mongodb_router1_host="mongodb-router1.${org}.test"
echo "${mongodb_router1_ip}    ${mongodb_router1_host}" >> $etc_hosts_file
export mongodb_router2_ip=$proxy2_ip
export mongodb_router2_host="mongodb-router2.${org}.test"
echo "${mongodb_router2_ip}    ${mongodb_router2_host}" >> $etc_hosts_file

export mongodb_master1_ip=$store1_ip
export mongodb_master1_host="mongodb-master1.${org}.test"
echo "${mongodb_master1_ip}    ${mongodb_master1_host}" >> $etc_hosts_file
export mongodb_slave0_ip=$store2_ip
export mongodb_slave0_host="mongodb-slave0.${org}.test"
echo "${mongodb_slave0_ip}    ${mongodb_slave0_host}" >> $etc_hosts_file
export mongodb_slave1_ip=$store3_ip
export mongodb_slave1_host="mongodb-slave1.${org}.test"
echo "${mongodb_slave1_ip}    ${mongodb_slave1_host}" >> $etc_hosts_file
export mongodb_slave2_ip=$store4_ip
export mongodb_slave2_host="mongodb-slave2.${org}.test"
echo "${mongodb_slave2_ip}    ${mongodb_slave2_host}" >> $etc_hosts_file
export mongodb_slave3_ip=$store5_ip
export mongodb_slave3_host="mongodb-slave3.${org}.test"
echo "${mongodb_slave3_ip}    ${mongodb_slave3_host}" >> $etc_hosts_file

export redis_vip=$proxy_vip
export redis_vhost="redis.${org}.test"
echo "${redis_vip}    ${redis_vhost}" >> $etc_hosts_file
export redis1_ip=$proxy1_ip
export redis1_host="redis1.${org}.test"
echo "${redis1_ip}    ${redis1_host}" >> $etc_hosts_file
export redis2_ip=$proxy2_ip
export redis2_host="redis2.${org}.test"
echo "${redis2_ip}    ${redis2_host}" >> $etc_hosts_file

export ingress_vip=$proxy_vip
export ingress_vhost="ingress.${org}.test"
echo "${ingress_vip}    ${ingress_vhost}" >> $etc_hosts_file
export ingress1_ip=$proxy1_ip
export ingress1_host="ingress1.${org}.test"
echo "${ingress1_ip}    ${ingress1_host}" >> $etc_hosts_file
export ingress2_ip=$proxy2_ip
export ingress2_host="ingress2.${org}.test"
echo "${ingress2_ip}    ${ingress2_host}" >> $etc_hosts_file

export kibana_vip=$proxy_vip
export kibana_vhost="kibana.${org}.test"
echo "${kibana_vip}    ${kibana_vhost}" >> $etc_hosts_file
export kibana1_ip=$proxy1_ip
export kibana1_host="kibana1.${org}.test"
echo "${kibana1_ip}    ${kibana1_host}" >> $etc_hosts_file
export elasticsearch_vip=$store_vip
export elasticsearch_vhost="elasticsearch.${org}.test"
echo "${elasticsearch_vip}    ${elasticsearch_vhost}" >> $etc_hosts_file
export elasticsearch1_ip=$store3_ip
export elasticsearch1_host="elasticsearch1.${org}.test"
echo "${elasticsearch1_ip}    ${elasticsearch1_host}" >> $etc_hosts_file
export elasticsearch2_ip=$store4_ip
export elasticsearch2_host="elasticsearch2.${org}.test"
echo "${elasticsearch2_ip}    ${elasticsearch2_host}" >> $etc_hosts_file
export logstash_vip=$store_vip
export logstash_vhost="logstash.${org}.test"
echo "${logstash_vip}    ${logstash_vhost}" >> $etc_hosts_file
export logstash1_ip=$store4_ip
export logstash1_host="logstash1.${org}.test"
echo "${logstash1_ip}    ${logstash1_host}" >> $etc_hosts_file
export logstash2_ip=$store5_ip
export logstash2_host="logstash2.${org}.test"
echo "${logstash2_ip}    ${logstash2_host}" >> $etc_hosts_file

export etcd_vip=$store_vip
export etcd_vhost="etcd.${org}.test"
echo "${etcd_vip}    ${etcd_vhost}" >> $etc_hosts_file
export etcd1_ip=$store3_ip
export etcd1_host="etcd1.${org}.test"
echo "${etcd1_ip}    ${etcd1_host}" >> $etc_hosts_file
export etcd2_ip=$store4_ip
export etcd2_host="etcd2.${org}.test"
echo "${etcd2_ip}    ${etcd2_host}" >> $etc_hosts_file
export etcd3_ip=$store5_ip
export etcd3_host="etcd3.${org}.test"
echo "${etcd3_ip}    ${etcd3_host}" >> $etc_hosts_file

export prometheus_vip=$store_vip
export prometheus_vhost="prometheus.${org}.test"
echo "${prometheus_vip}    ${prometheus_vhost}" >> $etc_hosts_file
export prometheus1_ip=$store1_ip
export prometheus1_host="prometheus1.${org}.test"
echo "${prometheus1_ip}    ${prometheus1_host}" >> $etc_hosts_file
export prometheus2_ip=$store2_ip
export prometheus2_host="prometheus2.${org}.test"
echo "${prometheus2_ip}    ${prometheus2_host}" >> $etc_hosts_file

export grafana_vip=$proxy_vip
export grafana_vhost="grafana.${org}.test"
echo "${grafana_vip}    ${grafana_vhost}" >> $etc_hosts_file
export grafana1_ip=$proxy1_ip
export grafana1_host="grafana1.${org}.test"
echo "${grafana1_ip}    ${grafana1_host}" >> $etc_hosts_file

export jenkins_vip=$builder_vip
export jenkins_vhost="jenkins.${org}.test"
echo "${jenkins_vip}    ${jenkins_vhost}" >> $etc_hosts_file
export jenkins1_ip=$builder1_ip
export jenkins1_host="jenkins1.${org}.test"
echo "${jenkins1_ip}    ${jenkins1_host}" >> $etc_hosts_file
export jenkins2_ip=$builder2_ip
export jenkins2_host="jenkins2.${org}.test"
echo "${jenkins2_ip}    ${jenkins2_host}" >> $etc_hosts_file


export harbor_vip=$store_vip
export harbor_vhost="harbor.${org}.test"
echo "${harbor_vip}    ${harbor_vhost}" >> $etc_hosts_file
export harbor1_ip=$store4_ip
export harbor1_host="harbor1.${org}.test"
echo "${harbor1_ip}    ${harbor1_host}" >> $etc_hosts_file
export harbor2_ip=$store5_ip
export harbor2_host="harbor2.${org}.test"


export sonar_vip=$store_vip
export sonar_vhost="sonar.${org}.test"
echo "${sonar_vip}    ${sonar_vhost}" >> $etc_hosts_file
export sonar1_ip=$store4_ip
export sonar1_host="sonar1.${org}.test"
echo "${sonar1_ip}    ${sonar1_host}" >> $etc_hosts_file
export sonar2_ip=$store5_ip
export sonar2_host="sonar2.${org}.test"


export nexus_vip=$store_vip
export nexus_vhost="nexus.${org}.test"
echo "${nexus_vip}    ${nexus_vhost}" >> $etc_hosts_file
export nexus1_ip=$store1_ip
export nexus1_host="nexus1.${org}.test"
echo "${nexus1_ip}    ${nexus1_host}" >> $etc_hosts_file
export nexus2_ip=$store2_ip
export nexus2_host="nexus2.${org}.test"


export npm_vip=$store_vip
export npm_vhost="npm.${org}.test"
echo "${npm_vip}    ${npm_vhost}" >> $etc_hosts_file
export npm1_ip=$store2_ip
export npm1_host="npm1.${org}.test"
echo "${npm1_ip}    ${npm1_host}" >> $etc_hosts_file
export npm2_ip=$store3_ip
export npm2_host="npm2.${org}.test"
