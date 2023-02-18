FROM nginx

#İnstalling python 3.9.14
RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install curl make gdebi-core build-essential libffi-dev libgdbm-dev libsqlite3-dev libssl-dev zlib1g-dev software-properties-common gdb lcov pkg-config libbz2-dev libgdbm-compat-dev liblzma-dev libncurses5-dev libreadline6-dev tk-dev uuid-dev && \
    apt-get update && \
    #apt-get -y build-dep python && \
    #apt-get -y build-dep python3 && \
    apt-get -y install pkg-config && \
    export PYTHON_VERSION=3.9.14 && \
    export PYTHON_MAJOR=3 && \
    curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xvzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure \
    --prefix=/opt/python/${PYTHON_VERSION} \
    --enable-shared \
    --enable-ipv6 \
    LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags && \
    make && \
    make install && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    /opt/python/${PYTHON_VERSION}/bin/python${PYTHON_MAJOR} get-pip.py && \
    alias 3914="opt/python/3.9.14/bin/python3"

CMD ["/bin/bash"]