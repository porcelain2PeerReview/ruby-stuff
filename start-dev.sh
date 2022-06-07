#!/bin/bash
eval $(ssh-agent)
ssh-add /home/$USER/$1
sudo docker build -t rails:dev .
sudo docker run -itd --name $2 -p 3000:3000 $(readlink -f $SSH_AUTH_SOCK):/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent rails:dev
