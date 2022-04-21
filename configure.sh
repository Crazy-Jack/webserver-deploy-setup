# # System Info: Ubuntu 18.04 LTS x64

# allow update ufw configure
sudo ufw disable 
sudo ufw allow OpenSSH
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 3306
sudo ufw allow 8000
sudo ufw show added
sudo ufw enable


# configure docker repo
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpgs
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# install docker app
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

