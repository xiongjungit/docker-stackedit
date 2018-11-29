#拉取基础镜像

#FROM       harbor.mxnet.io/library/ubuntu:14.04
FROM       daocloud.io/library/ubuntu:14.04 
MAINTAINER xiongjun,dockerxman <fenyunxx@163.com>

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
    git checkout `git describe --abbrev=0 --tags` && \
    echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc && \
    echo 'export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node' >> ~/.bashrc && \
    /bin/bash -c "source ~/.bashrc" && \
    /bin/bash -c "source ~/.bash_profile"	

#安装nodejs v10.14.0
RUN /bin/bash --login -c "nvm install v10.14.0" && \
    /bin/bash --login -c "nvm alias default v10.14.0"
	
#下载stackedit
RUN wget -O /tmp/master.zip https://github.com/benweet/stackedit/archive/master.zip && \
    unzip /tmp/master.zip -d /

#定义stackedit工作目录
WORKDIR  /stackedit-master

#安装cnpm
RUN /bin/bash --login -c "npm install -g cnpm --registry=https://registry.npm.taobao.org"

#安装stackedit
RUN /bin/bash --login -c "cnpm install -g bower" && \
    /bin/bash --login -c "cnpm install -g gulp" && \
    /bin/bash --login -c "npm install"

#暴露端口
EXPOSE 8080

#添加启动脚本
ADD run.sh /run.sh
RUN chmod +x /*.sh

#定义默认启动命令
CMD ["/run.sh"]

