FROM daaku/arch

ENV LANG en_US.UTF-8

RUN pacman --noconfirm --sync \
      autoconf \
      automake \
      bzr \
      cmake \
      colordiff \
      diffutils \
      docker \
      fakeroot \
      file \
      gcc \
      git \
      go \
      grep \
      htop \
      iotop \
      iputils \
      libtool \
      lsof \
      m4 \
      make \
      man-db \
      man-pages \
      mercurial \
      mosh \
      openssh \
      patch \
      pkg-config \
      procps-ng \
      rsync \
      scons \
      strace \
      sudo \
      tcpdump \
      time \
      tmux \
      vim \
      wget \
      which \
      whois \
      zip \
      zsh && \
  echo -e "y\ny\n" | pacman --sync --clean --clean

# install go doc, vet, lint binaries
RUN export GOPATH=/tmp/gopath && \
    go get \
      golang.org/x/tools/cmd/godoc \
      golang.org/x/tools/cmd/vet \
      github.com/golang/lint/golint && \
    mv $GOPATH/bin/golint /usr/bin/golint && \
    rm -rf $GOPATH

ADD locale.gen /etc/locale.gen
ADD locale.conf /etc/locale.conf
ADD sshd_config /etc/ssh/sshd_config
ADD sudoers /etc/sudoers.d/godev

RUN locale-gen
RUN ssh-keygen -A
RUN ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
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

EXPOSE 22 61001/udp
CMD ["/usr/sbin/sshd", "-D"]
