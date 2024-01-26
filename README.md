# nginx-proxy

Use this nginx server to proxy to another server.
That means, all the requests that this server will have, will be forwarded to the destination server you specify.

## Usage

### Build The Image

```sh
docker build . -t nginx-proxy
```

### Run The Image

```sh
docker run -d --name nginx-proxy -p <local-ssh-port>:22 -e "DESTINATION_SERVER=http://<destination-ssh-host>:<destination-ssh-port>" nginx-proxy:latest
```

#### Connect To The Container With `ssh`

We created a `sudo` user named `guest` that its password is `guest`.
Use it to login with `ssh`.

##### Interactive Shell

On you client machine, you can interactive `ssh` to the container with:

```
ssh guest@<destination-ssh-host> -p <destination-ssh-port> /bin/bash
```

> Don't worry if you don't see the prompt - the shell is still interactive.

#### Reverse Tunnel Port Forwarding With `ssh`

On your client machine, you can open a reverse tunnel port forwarding with `ssh`:

```
ssh guest@<destination-ssh-host> -f -N -R <destination-app-port-to-open>:<local-app-host>:<local-app-port>
```

Make sure that `<destination-app-port-to-open>` is open in the firewall of the *destination* server, to access the app.
