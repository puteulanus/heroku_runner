FROM centos:7
RUN yum install -y wget ruby screen vim which
ADD run.sh /root/run.sh
ENV HEROKU_EMAIL=
ENV CMD_URL=

RUN mkdir -p /usr/local/heroku
RUN cd /usr/local/heroku; wget -qO- https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz | tar xz
RUN mv /usr/local/heroku/heroku-client/* /usr/local/heroku/
RUN rm -rf /usr/local/heroku/heroku-client

CMD ["bash", "/root/run.sh"]