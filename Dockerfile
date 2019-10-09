# https://github.com/denisidoro/navi

FROM alpine:latest

WORKDIR /myapp

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        git \
	make \
	bash

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    yes | ~/.fzf/install 

RUN git clone --depth 1 https://github.com/denisidoro/navi && \
    cd navi && \
    make install

ENV PATH="~/.fzf/bin:${PATH}"

ENTRYPOINT [ "bash", "-c", "navi" ]
