MAINTAINER lmaly@redhat.com
FROM python:2.7.18
ADD gmvault-gmv-1.9.2-beta-1.tgz /home
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install \
    setuptools==32.1.0 \
    six==1.10.0 \
    chardet==2.3.0 \
    IMAPClient==1.0.2 \
    Logbook==1.0.0 \
    argparse==1.4.0 \
    pyOpenSSL==20.0.1 \
    mock==1.3.0 \
    backports.ssl==0.0.9 \
    cryptography==3.3.1 \
    pbr==5.5.1 \
    funcsigs==1.0.2 \
    ipaddress==1.0.23 \
    enum34==1.1.10 \
    cffi==1.14.4 \
    pycparser==2.20
RUN cd /home/gmvault-gmv-1.9.2-beta-1 ; python setup.py install --user
