FROM ubuntu:16.04
MAINTAINER Soo Lee (duplexa@gmail.com)

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y wget unzip less vim

# installing python
RUN apt-get install -y wget perl
RUN apt-get install -y build-essential checkinstall
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
WORKDIR /usr/bin/
RUN wget http://python.org/ftp/python/2.7.5/Python-2.7.5.tgz
RUN tar -xvf Python-2.7.5.tgz
WORKDIR Python-2.7.5
RUN ./configure
RUN make
RUN checkinstall -y

# installing pip
RUN apt-get install -y python-setuptools python-dev
RUN easy_install pip
#RUN pip install --upgrade virtualenv

# venv
#WORKDIR /usr/bin/
#RUN mkdir cooler
#WORKDIR cooler
#RUN virtualenv env
#RUN . env/bin/activate

# installing python libraries
RUN pip install numpy==1.11.1 matplotlib==1.5.3 scipy==0.18.1 biopython==1.68 joblib==0.10.2 h5py==2.6.0 pysam==0.9.1.4 bx-python==0.7.3 pandas

# other requirements
RUN apt-get install -y hdf5-tools libhdf5-serial-dev samtools

# download tools
WORKDIR /usr/local/bin
COPY downloads.sh .
RUN . downloads.sh

# set path

# wrapper
COPY run.sh .
RUN chmod +x run.sh

# default command
CMD ["run.sh"]

