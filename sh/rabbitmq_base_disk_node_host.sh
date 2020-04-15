#!/bin/bash

rabbitmqctl stop_app

rabbitmqctl reset

sudo rm -rf /var/log/rabbitmq/*

rabbitmqctl start_app