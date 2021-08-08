# Ref: https://pythonspeed.com/articles/activate-conda-dockerfile/
FROM continuumio/miniconda3

WORKDIR /app
COPY requirements.txt 12345.mp3 test.py ./
RUN conda create -n dev_fileserver python=3.7 
# Make RUN commands use the new environment:
# - Step1: "echo "conda activate dev_fileserver" >> ~/.bashrc " could export to .bashrc file
# - Step2: "SHELL ["/bin/bash", "--login", "-c"]" could reactivate /bin/bash to run the script at `~/.bashrc`
# - Step3: We could see the env default is set at `dev_filesercer`
RUN echo "conda activate dev_fileserver" >> ~/.bashrc \
    &&apt-get update \
    &&apt-get install -y \
    libsndfile1 \
    ffmpeg
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install -r requirements.txt
RUN python test.py

# Total_Size: 2.8GB