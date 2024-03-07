# nginx-proxy

Use this nginx server to proxy to another server.
That means, all the requests that this server will have, will be forwarded to the destination server you specify.

## Usage

|Env Variable|Default Value|Description Of Default Value|
|:---|:---|:---|
|`DESTINATION_HOST`|`localhost`|No definition for a particular host name|
|`DESTINATION_SERVER`|`http://172.17.0.1:80`|The local machine|

### Run The Image

You may use any of the following options to your liking:

#### Set A Server Proxy, With No Particular Host Name

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_SERVER=http://<destination-ip>:<destination-port>" ghcr.io/taljacob2/nginx-proxy
```

#### Set A Host Name, With No Server Proxy

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_HOST=<app.example.com>" ghcr.io/taljacob2/nginx-proxy
```

#### Set A Server Proxy With A Host Name

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_HOST=<app.example.com>" -e "DESTINATION_SERVER=http://<destination-ip>:<destination-port>" ghcr.io/taljacob2/nginx-proxy
```

## Development

### Build The Image Locally

```sh
docker build . -t nginx-proxy
```

### Build & Publish The Image On GitHub Repository

- Push to `master` branch to create `ghcr.io/taljacob2/nginx-proxy:master`
- Push a git tag with a semantic tagging of `v*.*.*` to create `ghcr.io/taljacob2/nginx-proxy:v*.*.*`
