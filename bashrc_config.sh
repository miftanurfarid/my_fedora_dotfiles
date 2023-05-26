#!/bin/bash

cat bashrc_user.txt >> /home/fafa/.bashrc
source /home/fafa/.bashrc
cat bashrc_root.txt >> /root/.bashrc
source /home/fafa/.bashrc
