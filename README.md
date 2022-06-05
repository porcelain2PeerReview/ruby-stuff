# ruby-stuff
Just trying to learn some ruby my dude
setting up a simple default dev environment for the ol ruby on rails

# Prerequisites:
  working on linux or a linux type vm/containered 
  .ssh key pair generated and available in your .ssh location\
  public key added to github
  config file setup to reference your private key
  proper permissions set on your private key (600 will work fine: chmod 600 ~/.ssh/<private-key>)
  running all docker scripts from the perspective of your user you wish to dev on
  
Example of config file in .ssh directory
  
 ```
 Host github.com
    User <user-email>
    Port 22
    Hostname github.com
    IdentityFile ~/.ssh/<private-key>
    TCPKeepAlive yes
    IdentitiesOnly yes
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    ```
    
# Setup

- clone the repository to your local directory of choosing
- run the startup script, including the name of your development container
  example: start-dev.sh <desired-container-name>
- login to the docker container: sudo docker exec -it <container-name> bash
- rails new <project-name>
- git init
