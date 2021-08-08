FROM  python:3.7-buster
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

LABEL description="This is the base docker image for the MVTool Experiment backend API."
# Install miniconda
WORKDIR /root

RUN mkdir -p ~/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
RUN bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 
#RUN export PATH="/root/miniconda3/bin/:$PATH"
ENV  PATH=/root/miniconda3/bin/:$PATH
RUN conda create -n dev_fileserver python=3.7
RUN conda init bash


RUN echo "conda activate dev_fileserver" >> ~/.bashrc \
    &&apt-get update \
    &&apt-get install -y \
    libsndfile1 \
    ffmpeg

WORKDIR /app
COPY requirements.txt 12345.mp3 test.py test_fastapi.py  entrypoint_fastapi.sh ./
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install -r requirements.txt

EXPOSE 4557
RUN chmod +x entrypoint_fastapi.sh
ENTRYPOINT ["./entrypoint_fastapi.sh"]
