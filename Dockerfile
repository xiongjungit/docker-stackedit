#拉取基础镜像

FROM       daocloud.io/library/ubuntu:latest
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

#安装nvm并设置node源为七牛源
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash && \
    echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc && \
    /bin/bash -c "source ~/.nvm/nvm.sh" && \
    echo 'source ~/.nvm/nvm.sh' >> ~/.profile  && \
    echo 'export NVM_NODEJS_ORG_MIRROR=http://dist.u.qiniudn.com' >> ~/.bashrc && \
    /bin/bash -c "source ~/.bashrc" && \
    /bin/bash -c "source ~/.profile"
	

#安装nodejs

RUN /bin/bash --login -c "nvm install iojs-v3.3.1" && \
    /bin/bash --login -c "nvm alias default iojs-v3.3.1"
	
#安装stackedit

RUN wget -O /tmp/master.zip https://github.com/benweet/stackedit/archive/master.zip && \
    unzip /tmp/master.zip -d /

WORKDIR  /stackedit-master
RUN /bin/bash --login -c "npm install -g bower" && \
    /bin/bash --login -c "npm install -g gulp" && \
    /bin/bash --login -c "npm install" && \
    /bin/bash --login -c "bower install --save --allow-root" && \
    /bin/bash --login -c "gulp"

#暴露端口
EXPOSE 3000

#定义默认启动命令
CMD ["export PORT=3000 && node server.js"]
