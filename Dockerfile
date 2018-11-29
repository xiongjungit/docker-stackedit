#拉取基础镜像
#FROM       harbor.mxnet.io/library/ubuntu:14.04
FROM       daocloud.io/library/ubuntu:14.04 
MAINTAINER xiongjun,dockerxman <fenyunxx@163.com>

#设置默认shell为/bin/bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#设置环境变量
ENV TZ "Asia/Shanghai"
ENV TERM xterm

#添加apt源
ADD sources.list /etc/apt/sources.list

#安装基础包
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

#安装nvm并设置node源为阿里云源
RUN git clone https://github.com/creationix/nvm.git ~/.nvm && \
    cd ~/.nvm && \
    git checkout `git describe --abbrev=0 --tags`  && \
    echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc && \
    echo 'export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node' >> ~/.bashrc  && \
    source ~/.bashrc

#安装nodejs v10.14.0
RUN bash -i -c 'nvm install v10.14.0' && \
    bash -i -c 'nvm alias default v10.14.0'
	
#下载stackedit
RUN wget -O /tmp/master.zip https://github.com/benweet/stackedit/archive/master.zip && \
    unzip /tmp/master.zip -d /

#定义stackedit工作目录
WORKDIR  /stackedit-master

#安装cnpm
RUN bash -i -c 'npm install -g cnpm --registry=https://registry.npm.taobao.org'

#安装stackedit
RUN bash -i -c 'cnpm install -g bower' && \
    bash -i -c 'cnpm install -g gulp' && \
    bash -i -c 'npm install'

#暴露端口
EXPOSE 8080

#添加启动脚本
ADD run.sh /run.sh
RUN chmod +x /*.sh

#定义默认启动命令
CMD ["/run.sh"]

