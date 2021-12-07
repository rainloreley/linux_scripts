#!/bin/bash
# According to Dockers official website: https://docs.docker.com/engine/install/ubuntu/

# Uninstall old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Setup repo
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# setup stable repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# install docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-compose

# ===========
echo "Done!"
