#!/bin/bash
#启动web管理插件
rabbitmq-plugins enable rabbitmq_federation  rabbitmq_federation_management  rabbitmq_management rabbitmq_management_agent rabbitmq_shovel rabbitmq_shovel_management rabbitmq_shovel_management rabbitmq_web_dispatch

rabbitmq-server

# rabbitmqctl stop_app

# rabbitmqctl reset

# rabbitmqctl start_app

