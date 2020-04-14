FROM rabbitmq

#更新镜像源为阿里源
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list

ENV LOCALE zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN cat /proc/version