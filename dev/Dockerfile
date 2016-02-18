FROM ubuntu:15.10

ADD sources.list /etc/apt/sources.list
ADD apt.conf /etc/apt/apt.conf.d/dev.conf
RUN echo "debconf debconf/frontend select noninteractive\n \
          debconf debconf/priority select critical" | debconf-set-selections

# locale
ADD locale.gen /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_COLLATE=C

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D # docker key

RUN apt-get update
RUN apt-get install \
      autoconf \
      automake \
      build-essential \
      ca-certificates \
      cmake \
      curl \
      docker-engine=1.9.1-0~wily \
      fakeroot \
      g++ \
      gawk \
      gcc \
      git \
      htop \
      jq \
      less \
      libpython-dev \
      libtool-bin \
      make \
      man-db \
      openssh-client \
      openssh-server \
      patch \
      pkg-config \
      python \
      python-pip \
      rsync \
      sudo \
      tmux \
      unzip \
      zip \
      zsh

ADD daaku-debs /usr/bin/daaku-debs
RUN daaku-debs go_1.6-godeb1_amd64.deb
RUN daaku-debs user-naitik-1.4.deb
RUN daaku-debs sudo-naitik-1.0.deb
RUN daaku-debs neovim-2016.02.05.deb

RUN echo "naitik:$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c16)" | chpasswd
VOLUME /home/naitik
ADD sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
