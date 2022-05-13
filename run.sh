#!/bin/sh
exec sudo docker run --rm --name gns3 --net=host --privileged -e BRIDGE_ADDRESS="172.21.1.1/24" -v ./data:/data localhost/docker-gns3-server
