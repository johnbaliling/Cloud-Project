# Cloud-Project: Cloud Network
Cybersecurity Cloud Project

### This is a collection of Linux Scripts and Ansible Scripts from my CyberClass.

Most of the scripts are used to configure cloud servers with different docker containers.

The final setup consisted of 4 servers running Damn Vulnerable Web Application (DVWA) containers. One being a jump box and another running an ELK stack container.

======


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/jpbling/Cloud-Project/blob/main/Diagrams/Cloud%20Project%20Diagram.png)
![](https://github.com/jpbling/Cloud-Project/blob/main/Diagrams/ELK_group_vnet%20Azure%20Diagram.PNG)
![](https://github.com/jpbling/Cloud-Project/blob/main/Diagrams/RedReamNetwork%20Azure%20Diagram.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml
  - filebeat-config.yml
  - filebeat-playbook.yml
  - metricbeat-config.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available/versatile, in addition to restricting congestion to the network.
Load balancers protect the availability aspect of security.
A jump box is a convenient system on a network used to access and manage devices in an separate zone, providing added security between security zones and allowing for organizations to monitor traffic easily by reviewing traffic to and from the jumpbox.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to logs on the systems it monitors and security threats found on system traffic.
 Filebeat watches for log files and forwards them to elastic search or logstash for indexing.
 Metricbeat records metrics and statistics from the operating system and from services running on the server.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| ELK      | Monitor  | 10.0.0.4   | Linux            |
| Web-1    | Server   | 10.0.0.5   | Linux            |
| Web-2    | Server   | 10.0.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the gateway machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 67.68.11.209 (Can be ajusted to personal IP address if changed on Azure inbound rules via Network Security Group)

Machines within the network can only be accessed by the container on jump box.
- The container within the jump box with IP address 172.17.0.1 is allowed access to the ELK VM.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses     |
|----------|---------------------|--------------------------|
| Jump Box | Yes                 | 67.68.11.209             |
| ELK      | Yes                 | 172.17.0.1, 67.68.11.209 |
| Web-1    | No                  | 172.17.0.1               |
| Web-2    | No                  | 172.17.0.1               |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
ansible allows for the setup of various servers in an infrastructure to be automated. This includes configuration management of OS, devices, or applications including installing and updating, or the starting and stopping of services.

The playbook implements the following tasks:
- Installs docker.io, python3-pip, and docker module
- Increases memory to 262144 via sysctl
- Downloads and launches a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/jpbling/Cloud-Project/blob/main/Diagrams/docker%20ps%20screenshot.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1
- Web-2

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
Filebeat collects the log events and monitors log files from specified locations on the server. This includes application, security, and system logs. An example can be an error.log files from apache that specify error 204 where that there is no content even after a successfully processed request.
Metricbeat collects metrics from the OS and from services running on the server on a regular basis. An example of what is collected is OS data like CPU, memory, load, network and process metricsets on a server so we can see the performance of a specific server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to **./ansible/roles/**.
- Update the hosts file to include (provided in **Cloud-Project\Ansible**):
[webservers]
10.0.0.4 ansible_pyhton_interpreter=/usr/bin/python3
10.0.0.5 ansible_pyhton_interpreter=/usr/bin/python3
10.0.0.6 ansible_pyhton_interpreter=/usr/bin/python3

[elk]
40.87.44.47 ansible_pyhton_interpreter=/usr/bin/python3

- Run the playbook, and navigate to [40.87.44.47:5601/](http://40.87.44.47:5601/) to check that the installation worked as expected.
- The playbook will install the correct software on the right host via "hosts:" specification on YAML file.
- Command to run playbook:
**ansible-playbook filebeat-playbook.yml**

(Script files in **Cloud-Project\Linux** provide more specific commands in comments)
