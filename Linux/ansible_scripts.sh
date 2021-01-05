#!/bin/bash
#Script should be run on ansible container in jump box.
#Runs ansible playbooks if not done already.
ansible-playbook dvwa.yml
ansible-playbook filebeat-playbook.yml
ansible-playbook filebeat-config.yml
ansible-playbook install-elk.yml
ansible-playbook metricbeat-config.yml
