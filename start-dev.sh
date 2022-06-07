#!/bin/bash
eval $(ssh-agent)
ssh-add /home/$USER/rails-dev
sudo docker build -t rails:dev .
sudo docker run -itd --name $1 -p 3000:3000 --mount type=bind, source=$SSH_AUTH_SOCK,target=/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent rails:dev
