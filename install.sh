# Update and upgrade
apt-get update
apt-get upgrade

# install ifconfig
apt install -y net-tools

# disable firewall
ufw disable

# config hosts file for all vms
sudo echo "172.16.0.10 main" | sudo tee -a /etc/hosts
sudo echo "172.16.0.20 node02" | sudo tee -a /etc/hosts
sudo echo "172.16.0.30 node03" | sudo tee -a /etc/hosts

# Docker instalation

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Setup local repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker engine

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io