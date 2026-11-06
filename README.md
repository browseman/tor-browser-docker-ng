# tor-browser-docker-ng

Provides an evironment for interaction with TOR over VNC
The spark for this project was [solarkennedy/ipmi-kvm-docker](https://github.com/solarkennedy/ipmi-kvm-docker) and later formed to the current state.

## This container runs

* supervisord - to manage all the processes
* tigervnc-standalone-server - A VNC server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* Firefox ESR - For regular browsing
* TorBrowser - Because... you need tor :D

## Usage

    # Build the docker image
    make build

    # Start the container
    docker compose up -d

    # Access it via VNC
    vncviewer 127.0.0.1:5900

    # or web
    open http://127.0.0.1:8080

You should see the firefox and tor brower started


### Custom resolution

By default, the VNC session will run with a resolution of 1680x1050 (with 32-bit color depth).
Custom resolutions can be specified with the docker environment variable RES, and must include color depth.
Simply modify the docker-compose.yml file.

