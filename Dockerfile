FROM docker.io/nginx:latest
COPY default.conf.template default.conf.template
ARG DESTINATION_SERVER=http://localhost:80
RUN cat default.conf.template | envsubst '$DESTINATION_SERVER' > /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
