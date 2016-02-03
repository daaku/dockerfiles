FROM ubuntu:15.10

ADD sources.list /etc/apt/sources.list
ADD apt.conf /etc/apt/apt.conf.d/dev.conf
RUN echo "debconf debconf/frontend select noninteractive\n \
          debconf debconf/priority select critical" | debconf-set-selections

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D # docker key
RUN apt-get update
RUN apt-get install locales

# locale
ADD locale.gen /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LC_COLLATE=C

RUN apt-get install \
      autoconf \
      automake \
      build-essential \
      ca-certificates \
      cmake \
      curl \
      docker-engine \
      g++ \
      gawk \
      gcc \
      git \
      htop \
      less \
      libpython-dev \
      libtool \
      make \
      man-db \
      openssh-client \
      openssh-server \
      patch \
      rsync \
      sudo \
      tmux \
      unzip \
      vim \
      zip \
      zsh

# install go, doc, vet, golint binaries
RUN export GOPATH=/tmp/gopath && \
    mkdir $GOPATH && \
    cd $GOPATH && \
    curl https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz | \
      tar --extract --gunzip --directory $GOPATH && \
    $GOPATH/godeb install 1.5.3 && \
    go get \
      golang.org/x/tools/cmd/godoc \
      golang.org/x/tools/cmd/vet \
      github.com/golang/lint/golint && \
    mv $GOPATH/bin/golint /usr/bin/golint && \
    rm -rf $GOPATH

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
ADD sudoers /etc/sudoers.d/naitik
RUN groupadd --gid 1666 naitik
RUN useradd \
      --comment "Naitik Shah" \
      --gid naitik \
      --groups users \
      --shell /usr/bin/zsh \
      --uid 1666 \
      naitik
RUN echo "naitik:$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c16)" | chpasswd
VOLUME /home/naitik

ADD sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
