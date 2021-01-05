#!/bin/bash
# Use gitbash (for windows) on admin device
# Run ssh-keygen with no passphrase if no public key has been made yet for key pairing
#ssh-keygen
# Ensure Jump Box username is radmin and password is public key found on ~/.ssh/id_rsa/id_rsa.pub 
#when configuring Jump Box on Azure
ssh -i ~/.ssh/id_rsa/id_rsa radmin@104.42.55.15
