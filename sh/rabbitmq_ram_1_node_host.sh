#!/bin/bash
rabbitmq-plugins enable rabbitmq_federation  rabbitmq_federation_management  rabbitmq_management rabbitmq_management_agent rabbitmq_shovel rabbitmq_shovel_management rabbitmq_shovel_management rabbitmq_web_dispatch

rabbitmq-server

# rabbitmqctl join_cluster --ram rabbitmq_disk_node

# rabbitmqctl stop_app

# rabbitmqctl reset


# rabbitmqctl start_app
# rabbitmq-server
