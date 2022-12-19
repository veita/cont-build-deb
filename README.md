# Debian Build System

Build a Debian/Ubuntu build system container image.


## Run the image build

To build an image for Debian 11 Bullseye run

```bash
./build-container.sh
```

To build an image with a specific Debian or Ubuntu version
* `debian:buster` Debian 10,
* `debian:bullseye` Debian 11,
* `debian:bookworm` Debian 12,
* `debian:testing`,
* `debian:sid`,
* `ubuntu:bionic` Ubuntu 18.04 LTS,
* `ubuntu:focal` Ubuntu 20.04 LTS,
* `ubuntu:jammy` Ubuntu 22.04 LTS,
* `ubuntu:kinetic` Ubuntu 22.10,
* `ubuntu:devel`

run

```bash
./build-container.sh ubuntu:focal
```

## Run the container

Run the container interactively. For SSH access you might want to make
your SSH keys accessible from inside the container. E.g.

```bash
alias podman = docker

# change to the project working directory
cd $WORKING_DIR

podman run --rm -it \
 --mount type=bind,source="`pwd`",target=/qsk \
 --mount type=bind,source="$HOME/.ssh",target="/root/.ssh",ro=true \
 localhost/build-deb-debian:bullseye
```


## Safety

Do not run `setup.sh` in your host system.

