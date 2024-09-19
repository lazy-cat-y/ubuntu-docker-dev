FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    libreadline-dev \
    zlib1g-dev \
    libicu-dev \
    libssl-dev \
    flex \
    git \   
    gdb \
    openssh-server \
    pkg-config \
    make \
    vim \
    clang \
    clangd \
    clang-format \
    clang-tidy 

# Create developer user
RUN useradd -m developer && echo "developer:developer" | chpasswd && adduser developer sudo

# configure bash for developer user
RUN echo "if [ -f /etc/bash_completion ]; then\n    . /etc/bash_completion\nfi" >> /home/developer/.bashrc && \
    echo "alias ll='ls -la --color=auto'" >> /home/developer/.bashrc && \
    echo "HISTSIZE=1000\nHISTFILESIZE=2000" >> /home/developer/.bashrc && \
    echo "export PROMPT_COMMAND='history -a'" >> /home/developer/.bashrc

RUN echo "\"\e[A\": previous-history\n\"\\e[B\": next-history\n\"\\e[D\": backward-char\n\"\\e[C\": forward-char" > /home/developer/.inputrc

# Use bash as default shell on developer user
RUN chsh -s /bin/bash developer

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER developer

CMD [ "/bin/bash" ]

