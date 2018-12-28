#!/bin/bash

# Setup auditd
# command example:
# 	aureport --tty
#
# to view root commands:
# 	ausearch -ue 0
# to view user commands:
# 	ausearch -ua <userid>

#running package update command
apt-get update

# install the package
apt-get install -y auditd

# delete the line pam_tty_audit.so
# this line is used by default to disable user auditing

sed -i '/pam_tty_audit.so/d' /etc/pam.d/sshd

# add this line to the bottom of the file
# enabling user auditing by enable the pam_tty_audit module

echo 'session required pam_tty_audit.so enable=*' >> /etc/pam.d/sshd

# add a couple more required lines:
# adding auditing rules to log all system calls made from root account
echo '-a exit,always -F arch=b64 -F euid=0 -S execve -k rootact' >> /etc/audit/audit.rules
echo '-a exit,always -F arch=b32 -F euid=0 -S execve -k rootact' >> /etc/audit/audit.rules

# adding auditing rules to log all system calls made from the user account
echo '-a exit,always -F arch=b64 -F euid>=1000 -S execve -k useract' >> /etc/audit/audit.rules
echo '-a exit,always -F arch=b32 -F euid>=1000 -S execve -k useract' >> /etc/audit/audit.rules

