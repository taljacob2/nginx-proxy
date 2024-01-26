FROM docker.io/nginx:latest
COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh
RUN apt-get update && apt-get -y install sudo
RUN useradd -m guest && echo "guest:guest" | chpasswd && adduser guest sudo
ENV DESTINATION_SERVER=http://localhost:80
CMD ./startup.sh $DESTINATION_SERVER
