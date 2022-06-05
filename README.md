# ruby-stuff
Just trying to learn some ruby my dude
setting up a simple default dev environment for the ol ruby on rails

# Prerequisites:
  - Working on linux or a linux type vm/containered <br> 
  - Docker.io installed on host machine
  - .ssh key pair generated and available in your .ssh location <br> 
  - Public key added to github  <br> 
  - PAT (Personal Access Token) to create repository remotely <br> 
  - Config file setup to reference your private key <br> 
  - Proper permissions set on your private key (600 will work fine: chmod 600 ~/.ssh/<private-key>) <br> 
  - Running all docker scripts from the perspective of your user you wish to dev on <br> 
  
Example of config file in .ssh directory <br>
  
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
    
# Local Docker Dev Environment Setup

  
- Clone the repository to your local directory of choosing
- run the startup script, including the name of your development container <br>
```
  example: start-dev.sh <desired-container-name>
```
- login to the docker container: <br>
```
  sudo docker exec -it <container-name> bash 
```
- create a new project <br>
```
  rails new <project-name>
```
  
# Creating a New Remote Repository
- Create Repository Remotely <br>
```
curl -u '<user-name>' -H "Authorization: token <pat-token>" https://api.github.com/users/repos -d '{"name":"<new-repository-name","private":"true"}'
```
- First Commit: <br>
```
  echo "# <new-repository-name" >> README.md 
  git init 
  git add README.md 
  git commit -m "first commit" 
  git branch -M main 
  git remote add origin git@github.com:<owner>/<repo-name>.git 
  git push -u origin main 
```
  
