FROM docker.io/nginx:latest
COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh
ENV DESTINATION_SERVER=http://localhost:80
CMD ./startup.sh $DESTINATION_SERVER
