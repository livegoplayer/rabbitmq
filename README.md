# rabbitmq
个人使用的rabbitmq docker 

请保持data和log下有对应文件夹，不然会报错
启动时间有点慢

启动脚本：

1. 安装configmap
bash install-config-map.sh
2. 安装 证书
kubectl apply -f cert.yaml -n rabbitmq-server
3. 安装 rabbitmq
kubectl apply -f rabbitmq-disk-node-deployment.yaml -n rabbitmq-server 


