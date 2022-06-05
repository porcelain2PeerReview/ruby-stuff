#!/bin/bash

sudo docker run -itd --name $1 -p 3000:3000 -v ~/.ssh:/root/.ssh rails:dev
