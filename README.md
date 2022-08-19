# Jupyter notebook on ubuntu
Install anaconda & Launch jupyter server on ubuntu environment.

This image is based on ubuntu:18.04 official image.

Docker hub => https://hub.docker.com/r/mysterias/notebook

## Pull Image
```$ docker pull mysterias/notebook```

## Run docker container
```$ docker run -d -it -p {host-port}:8888 --name jupyter-server mysterias/notebook:anaconda/jupyter```

- You can set your own host machine port number on `host-port`.

## Access into container
```$ docker exec -it jupyter-server bash```

## Launch jupyter notebook
```/ jupyter notebook```

## Open jupyter notebook
- `localhost:{host-port}`
- Default access password is **1234**
- You can generate and modify password through following steps:

```
# generate security password
from notebook.auth import passwd
passwd(algorithm="sha1")
```
```
# Modify Dockerfile on Github and re-build image
RUN echo "c.NotebookApp.password = '{your-own-password}'" >> /root/.jupyter/jupyter_notebook_config.py
```
