#!/bin/bash
#Run after ssh into jumpbox from admin device
apt install docker.io
docker pull cyberxsecurity/ubuntu
docker images 
#shows size and other details
docker run -it cyberxsecurity/ubuntu:bionic bash
docker run -it  cyberxsecurity/ansible bash
#Makes sure to note ansible container name.

#Create Web-1 and Web-2 in RedTeam Resource Group following diagrams
#You can ssh into them via commands:
#ssh -i ~/.ssh/id_rsa/id_rsa radmin@10.0.0.5
#ssh -i ~/.ssh/id_rsa/id_rsa radmin@10.0.0.6

#Go into ansible container via commands:
sudo docker start [ansible_container_name]
sudo docker attach [ansible_container_name]

#For example: 
#sudo docker start pensive_bardeen
#sudo docker attach pensive_bardeen

#Once in ansible container, can run playbooks in ansible folder (Cloud-Project\Ansible)
#Run playbooks via command:
#ansible-playbook <filename.yml>
