FROM docker.io/nginx:stable-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf

COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh

# No definition for a particular host name
ENV DESTINATION_HOST=localhost

# The local machine, which runs the docker container
ENV DESTINATION_SERVER=http://172.17.0.1:80

CMD ./startup.sh $DESTINATION_HOST $DESTINATION_SERVER
