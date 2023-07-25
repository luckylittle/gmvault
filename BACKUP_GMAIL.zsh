#!/bin/zsh

export USERNAME='user'
# Only sync from specific date range (e.g. entire month of July)
export AFTER='2023/06/30'
export BEFORE='2023/08/01'

echo "Starting archive of ${USERNAME}@gmail.com..."
echo '##############################################'
mkdir ${USERNAME}_gmail_com
podman run \
  --security-opt label=disable \
  --name gmvault_${USERNAME}_gmail_com \
  -v ./gmvault/:/root/.gmvault/ \
  -v ./${USERNAME}_gmail_com:/root/${USERNAME}_gmail_com/ \
  -i -t \
  -w /root/ \
  gmvault-gmv-1.9.2-beta-1 \
  .local/bin/gmvault sync \
  --type custom \
  --gmail-req "after:${AFTER} before:${BEFORE}" \
  ${USERNAME}@gmail.com \
  -d /root/${USERNAME}_gmail_com

# An alarm will go off to announce the end of sync
# /usr/bin/speaker-test -l 1 -t wav -w Beep.wav

# Remove the containers and volumes
podman rm gmvault_${USERNAME}_gmail_com
podman volume rm gmvault ${USERNAME}_gmail_com

# *Optional* - also remove the images
# podman rmi localhost/gmvault-gmv-1.9.2-beta-1
# podman rmi docker.io/library/python:2.7.18

# Turn off the computer after you finish
#sudo shutdown now
