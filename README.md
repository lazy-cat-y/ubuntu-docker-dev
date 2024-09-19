# Ubuntu docker image

## Description

This is a docker image base on Ubuntu with default user `developer` and password `developer` and `C++` development tools.

## Installation

-   Install [Docker](https://www.docker.com/).
-   Clone this repository.

```bash
git clone git@github.com:lazy-cat-y/ubuntu-docker-dev.git /docker-ubuntu
cd /docker-ubuntu
```

-   Build the image.

```bash
docker build -t ubuntu-dev .
```

## Running and managing the container

-   Run the container.

```bash
docker run -it --name ubuntu-dev-container ubuntu-dev /bin/bash
```

-   Reattach to the container.

```bash
docker attach ubuntu-dev-container
```

-   Exit the container.

```
Ctrl + P + Q
```

-   Stop the container.

```bash
docker stop ubuntu-dev-container
```

-   Start the container.

```bash
docker start -i ubuntu-dev-container
```
