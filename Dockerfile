FROM ubuntu:18.04

# setting basic directory
WORKDIR /home
RUN mkdir /soft
RUN mkdir /workspace
RUN apt-get update
RUN apt-get install -y net-tools wget nano lsof

# Anaconda installing
WORKDIR /home/soft
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
RUN bash Anaconda3-2020.07-Linux-x86_64.sh -b -p /home/soft/anaconda
RUN rm Anaconda3-2020.07-Linux-x86_64.sh
ENV PATH /home/soft/anaconda/bin:$PATH

WORKDIR /root/.jupyter
RUN jupyter notebook --generate-config

# jupyter server setting
RUN echo "c.NotebookApp.password = 'sha1:b00ee0c0e13c:9b3f0c11356d567b4b9c516af4aeae5df5a2f1e4'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password_require=True" >> /root/.jupyter/jupyter_notebook_config.py110a0e6ab9fe
RUN echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py

# set jupyter server excute location
WORKDIR '/home/soft'
