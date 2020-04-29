#!/bin/bash

# 该文件用来管理启动服务器之后的其他操作，因为是单进程，所以启动服务器之后的其他操作都需要另外启动进程运行
#添加管理员
rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator

sh # 执行进程，阻塞挂起
