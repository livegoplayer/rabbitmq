#!/bin/bash
kubectl create namespace rabbitmq-server
kubectl create configmap rabbitmq-dist-config-map --from-file=config/rabbitmq_disk_node -n rabbitmq-server
