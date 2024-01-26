# Prepare files.
FROM docker.io/nginx:latest
COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh

# Create guest sudo user.
RUN apt-get update && apt-get -y install sudo
RUN useradd -m guest && echo "guest:guest" | chpasswd && adduser guest sudo

# Install ssh server.
RUN apt install openssh-server -y

# Prepare and start nginx.
ENV DESTINATION_SERVER=http://localhost:80
CMD ./startup.sh $DESTINATION_SERVER
