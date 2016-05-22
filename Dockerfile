FROM centos:7
RUN yum install -y wget ruby screen vim which sudo
RUN wget -O- https://toolbelt.heroku.com/install.sh | sh
ADD run.sh /root/run.sh
CMD PATH="/usr/local/heroku/bin:$PATH"; bash /root/run.sh