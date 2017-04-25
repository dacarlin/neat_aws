#!/bin/bash 
sudo yum install fish git 
curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink_4.0.0.190159.zip
unzip -P SmrT3chN smrtlink_4.0.0.190159.zip
yes "Y" | ./smrtlink_4.0.0.190159.run --rootdir smrt
