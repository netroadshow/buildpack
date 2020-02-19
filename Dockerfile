FROM buildpack-deps:buster

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    dos2unix \
    jq \
    rsync \
    zip \
    python3-pip \
    python3-setuptools && \
    pip3 install --no-cache-dir \
    awscli \
    jinja2-cli \
    selenium \
    python-jenkins==1.5.0 \
    autopep8 && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash && \
    source /root/.bashrc && \
    nvm install lts/argon && \
    nvm install 5 && \
    nvm install lts/boron && \
    nvm install lts/carbon && \
    nvm install lts/dubnium && \
    nvm install lts/erbium && \
    nvm use lts/dubnium && nvm alias default lts/dubnium && \
    npm install -g --no-cache editorconfig-tools && \
    rm -rf /var/lib/apt/lists/* /root/.npm /root/.cache && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    mkdir -p /work

WORKDIR /work
ENTRYPOINT []
CMD ["/bin/bash"]
