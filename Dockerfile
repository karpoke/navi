# https://github.com/denisidoro/navi

FROM alpine:latest

WORKDIR /myapp

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash \
        curl \
        git \
        make

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    yes | ~/.fzf/install 

RUN git clone https://github.com/denisidoro/navi && \
    cd navi && \
    git checkout tags/v0.12.0 && \
    make install

ENV PATH="~/.fzf/bin:${PATH}"

ENTRYPOINT [ "bash", "-c", "navi $0 $@ --print" ]
