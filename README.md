# [Note] How to set a dockerfile for conda env?

# Intro
This repo is a practice to construct a docker container to run conda env.
Use differnet base image `python` & `miniconda` to build the service.
The test function is about separating the audio with spleeter.

# Ref
- [Must Read]Activating a Conda environment in your Dockerfile
https://pythonspeed.com/articles/activate-conda-dockerfile/

- How to Install miniconda on linux (from the command line only) 
https://waylonwalker.com/install-miniconda/
```
```

# Material
- 12345.mp3 : waited for separation
- requirements.txt: spleeter version
- test.py: script to operate sound separation

# python.dockerfile
A dockerfile bases on python3.7 and installs the miniconda.
Activate the conda env to run the `test.py` to use spleeter's audio separation. 
## Build the image
```=bash
$docker build -f python.dockerfile -t conda_env_basedon_python .
```
## Up the cotainer
```=bash
$sudo docker run -it --name test_construct conda_env_basedon_python /bin/bash
```
## if you want to rm the container after exit the container
```=bash
sudo docker run --rm -it --name test_construct conda_env_basedon_python /bin/bash
```


# miniconda.dockerfile
A dockerfile bases on miniconda image.

## Build the image
```=bash
$ docker build -f miniconda.dockerfile -t conda_env_basedon_mini .
```
## Up the cotainer
```=bash
$ sudo docker run -it --name test_construct_mini conda_env_basedon_mini /bin/bash
```

## if you want to rm the container after exit the container
```=bash
$ sudo docker run --rm -it --name test_cotest_construct_mini conda_env_basedon_mini /bin/bash
```

# fastapi.dockerfile
This docker file is for test the fastapi service using.
## Build the image
```=bash
$ docker build -f fastapi.dockerfile -t test_fastapi_image .
```
## Up the cotainer
```=bash
$ sudo docker run -it --name test_fastapi_container test_fastapi_image /bin/bash
```

## if you want to rm the container after exit the container
```=bash
$ sudo docker run --rm -it --name test_fastapi_container test_fastapi_image /bin/bash
```

# Other
- Clean the builder cache of docker
```
$ docker builder prune 
```
- Look the resource used at a container
```
$ sudo docker top 69cba92b5a44
```
- Remove build cache
```
$ sudo docker builder prune
```
- Monitor the resource that used by the container
```
$ sudo docker stats docker_container
```
<img width="884" alt="圖片" src="https://user-images.githubusercontent.com/9137836/128633442-4d232079-a9c1-4805-8a94-93c0808d61a0.png">
