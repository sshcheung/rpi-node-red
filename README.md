Overview
========

Raspberry PI 2 specific docker image with Node-Red

Pull
=======

```docker pull sshcheung/rpi-node-red```

Building
=======

```docker build -t <username>/rpi-node-red```

Running
=======

* This image expects you to mount the node-red user data directory to /etc/node-red.  This allows you to inject configuration into the container
* This image exposes the default port 1880
* Additional npm packaged nodes can be specified in /etc/node-red/package.json.  These will be installed locally in the user data directory. 

Example run command
```docker run -d -p 1880:1880 -v /opt/node-red:/etc/node-red <username>/rpi-node-red```

You can then access the Node-RED editor at http://[docker-host-ip]:1880
