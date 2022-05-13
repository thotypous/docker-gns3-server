FROM ubuntu:18.04

# Install the magic wrapper.
ADD ./start.sh /start.sh
ADD ./config.ini /config.ini
ADD ./requirements.txt /requirements.txt
COPY dependencies.json /tmp/dependencies.json

ENV LC_ALL en_US.UTF-8

RUN mkdir /data && \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y tzdata locales software-properties-common \
    && locale-gen $LC_ALL \
    && add-apt-repository -y ppa:gns3/ppa \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y cpulimit dnsmasq docker.io dynamips libcap-dev qemu-utils qemu-system-x86 ubridge vpcs gns3-server \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y gns3-iou \
    && echo '127.0.0.127 xml.cisco.com' >> /etc/hosts

CMD [ "/start.sh" ]

WORKDIR /data

VOLUME ["/data"]

