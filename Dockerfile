FROM debian:buster-slim

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    netbase \
    wget \
    git \
    bzip2 \
    xz-utils \
    zip \
    unzip \
    tar \
    openssh-client \
    procps \
    file \
    python3-pip \
    python3-setuptools \
    dos2unix \
    rsync \
    jq \
    libpq-dev && \
    pip3 install --no-cache-dir \
    awscli \
    jinja2-cli \
    selenium \
    python-jenkins==1.5.0 \
    autopep8 && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash && \
    source /root/.bashrc && \
    nvm install 10 && \
    npm install -g --no-cache editorconfig-tools && \
    rm -rf /var/lib/apt/lists/* /root/.npm /root/.cache && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    mkdir -p /work

WORKDIR /work
ENTRYPOINT []
CMD ["/bin/bash"]
