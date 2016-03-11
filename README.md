# docker-shockpot

This is Docker image for honeypot Shockpot (https://github.com/threatstream/shockpot).

Build docker image
    
    $ git clone https://github.com/GovCERT-CZ/docker-shockpot
    $ cd docker-shockpot
    $ docker build -t <repository>/<name> .
    
Run docker container
    
    $ docker run [--name <container name>] [-d] -p 80:80  [-v <host path>:/opt/shockpot/log] <repository>/<name>
    

Run docker container with custom configuration
    
    $ wget https://raw.githubusercontent.com/threatstream/shockpot/master/shockpot.conf -O shockpot.conf
    update shockpot.conf file with your settings (change port to 80 - default 8080)
    $ docker run [--name <container name>] [-d] -p 80:80 [-v <host path>/shockpot.conf:/opt/shockpot/shockpot.conf] [-v <host path>:/opt/shockpot/log] <repository>/<name>
    
