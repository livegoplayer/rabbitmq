#!/bin/bash
rabbitmq-plugins enable rabbitmq_management

rabbitmq-server

# rabbitmqctl join_cluster --ram rabbit@rabbitmq_disk_node

# rabbitmqctl stop_app

# rabbitmqctl reset


# rabbitmqctl start_app
# rabbitmq-server
