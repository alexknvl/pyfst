FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y build-essential libatlas-base-dev python-dev python-pip git automake autoconf libtool
RUN apt-get install -y wget
RUN apt-get install -y mc

RUN wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.3.4.tar.gz
RUN tar -zxvf openfst-1.3.4.tar.gz
WORKDIR /openfst-1.3.4
RUN ./configure
RUN make -j 4
RUN make install

COPY . /pyfst

WORKDIR /pyfst

RUN pip install -r requirements.txt

RUN python setup.py install

