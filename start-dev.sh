#!/bin/bash
USER_ID=$(id $USER -u)
eval $(ssh-agent)
ssh-add /home/$USER/.ssh/$1
docker image build -t rails:dev --build-arg USER_ID=$USER_ID .
docker run -itd --name $2 -p 3000:3000 --mount type=bind,source=$SSH_AUTH_SOCK,target=/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent rails:dev
