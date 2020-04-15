FROM rabbitmq

#更新镜像源为阿里源
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list

ENV LOCALE zh_CN.UTF-8
ENV TZ=Asia/Shanghai
ENV BASE_SH rabbitmq_base_disk_node_host.sh
ENV EXT_SH_1 rabbitmq_ram_1_node_host.sh
ENV EXT_SH_2 rabbitmq_ram_2_node_host.sh

ENV SH_DIR = /tmp

COPY ./sh /tmp
RUN sed -i -e 's/\r$//' /tmp/*.sh
RUN chmod +x /tmp/*.sh