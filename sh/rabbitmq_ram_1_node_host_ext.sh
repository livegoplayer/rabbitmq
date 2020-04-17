#!/bin/bash

# 该文件用来管理启动服务器之后的其他操作，因为是单进程，所以启动服务器之后的其他操作都需要另外启动进程运行
# 加入主节点
rabbitmqctl stop_app

rabbitmqctl reset

rabbitmqctl join_cluster --ram rabbit@rabbitmq_disk_node

rabbitmqctl start_app
