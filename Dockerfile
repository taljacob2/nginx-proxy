FROM docker.io/nginx:latest
COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh
ENV DESTINATION_HOST=localhost                          # No definition for a particular host name
ENV DESTINATION_SERVER=http://172.17.0.1:80             # The local machine, which runs the docker container
CMD ./startup.sh $DESTINATION_HOST $DESTINATION_SERVER
