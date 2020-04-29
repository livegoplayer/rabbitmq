FROM rabbitmq

# 新增key
#RUN apt-get install gpg
#RUN gpg --recv-keys DCC9EFBF77E11517
#RUN gpg --recv-keys 648ACFD622F3D138

#更新apt-get源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
	echo "deb http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse" >/etc/apt/sources.list

RUN apt-get update
#RUN gpg --recv-keys 4D270D06F42584E6
#run apt-cache policy debian-keyring

ENV LOCALE zh_CN.UTF-8
ENV TZ=Asia/Shanghai
ENV BASE_SH rabbitmq_base_disk_node_host.sh
ENV EXT_SH_1 rabbitmq_ram_1_node_host.sh
ENV EXT_SH_2 rabbitmq_ram_2_node_host.sh

ENV SH_DIR = /tmp

RUN apt-get -qq update && \
  apt-get -yqq install \
  python-pip 


#ADD-SUPERVISOR
# install Supervisor config
RUN pip2 install supervisor && \
    pip2 install supervisor-stdout

#创建日志目录
RUN mkdir /var/logs/
#rabbitmq 原生控制台输出日志目录
RUN mkdir /var/logs/rabbitmq_console_log
#rabbitmq 日志输出目录
RUN mkdir /var/logs/rabbitmq_log
#rabbitmq 默认日志输出目录，如果设置了上面那个，这个就不需要了
RUN mkdir /var/logs/rabbitmq_base_log

#拷贝配置文件目录
COPY ./config/*.conf /etc/rabbitmq/

# 拷贝基本的sh文件进去
COPY ./sh /tmp
COPY ./wait-for-it/wait-for-it.sh /tmp/wait-for-it.sh
COPY ./supervisor/sh /tmp
RUN sed -i -e 's/\r$//' /tmp/*.sh
RUN chmod +x /tmp/*.sh

# 拷贝supervisor基本的conf文件进去
RUN mkdir /etc/supervisor
RUN mkdir /etc/supervisor/conf.d
COPY ./supervisor/conf.d/*.conf /etc/supervisor/conf.d/
RUN cd /etc/supervisor/conf.d && ls -l
# RUN chmod +x /etc/supervisor/conf.d/*.conf