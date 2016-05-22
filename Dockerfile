FROM centos:7
RUN yum install -y wget ruby screen vim which sudo
RUN wget https://toolbelt.heroku.com/install.sh 
RUN bash install.sh
ADD run.sh /root/run.sh
RUN source ~/.profile
CMD bash /root/run.sh