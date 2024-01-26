FROM docker.io/nginx:latest
COPY default.conf.template .
COPY startup.sh .
RUN chmod +x ./startup.sh
ENV DESTINATION_HTTP_SERVER=localhost:80
ENV DESTINATION_HTTPS_SERVER=localhost:443
CMD ./startup.sh $DESTINATION_HTTP_SERVER $DESTINATION_HTTPS_SERVER
