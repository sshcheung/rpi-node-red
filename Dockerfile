FROM resin/armv7hf-node:0.10.36-wheezy
MAINTAINER Simon Cheung <cheung.sai.ho@gmail.com>

ENV GPIO_VERSION 0.5.11
ENV NODERED_VERSION 0.10.4
ENV NODERED_USERDIR /etc/node-red

RUN apt-get update \
 && apt-get install -y python-dev \
 && cd /tmp \
 && wget https://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-${GPIO_VERSION}.tar.gz \
 && tar -xvf RPi.GPIO-${GPIO_VERSION}.tar.gz \
 && cd RPi.GPIO-${GPIO_VERSION} \
 && python setup.py install \
 && cd .. \
 && rm -rf /tmp/*

ADD files/start-node-red.sh /usr/local/bin/start-node-red.sh
RUN chmod +x /usr/local/bin/start-node-red.sh

RUN npm install -g node-red@${NODERED_VERSION} \
 && mkdir ${NODERED_USERDIR}

VOLUME [${NODERED_USERDIR}]

EXPOSE 1880

CMD ["/usr/local/bin/start-node-red.sh"]
