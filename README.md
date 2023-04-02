Hi
This docker container will take a screenshot from any web site that 
you want.

simply run these commands:
docker volume create screen

docker build . -t screen

docker run --privileged -it -e url="full_url" -e DISPLAY=:0 -v /$PWD:/screen screen
