#!/bin/bash

# References:
# https://docs.docker.com/engine/install/fedora/
# https://docs.docker.com/engine/install/linux-postinstall/

DOCKER_USER="fedora"

if [ "$EUID" -ne 0 ] ; then
	echo "Please run $0 as root"
	exit 1
fi

create_config() {
	F="/etc/docker/daemon.json"
	echo "{" > ${F}
	echo '   "storage-driver": "overlay2"' >> ${F}
	echo "}" >> ${F}
}

dnf -y install dnf-plugins-core || exit 1
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo || exit 1
dnf -y install docker-ce docker-ce-cli containerd.io || exit 1
create_config
systemctl start docker
systemctl enable docker.service
sudo systemctl enable containerd.service
usermod -aG docker ${DOCKER_USER}
docker version || exit 1
