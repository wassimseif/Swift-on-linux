
# Set WORKDIR
cd /root

# Linux OS utils
sudo apt-get update && apt-get install -y \
  automake \
  build-essential \
  clang \
  curl \
  gcc-4.8 \
  git \
  g++-4.8 \
  libblocksruntime-dev \
  libbsd-dev \
  libglib2.0-dev \
  libpython2.7 \
  libicu-dev \
  libkqueue-dev \
  libtool \
  lsb-core \
  openssh-client \
  vim \
  wget \
  binutils-gold \
  libcurl4-openssl-dev \
  openssl \
  libssl-dev



echo "set -o vi" >> /root/.bashrc

# Install Swift compiler
wget https://swift.org/builds/development/ubuntu1404/swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a/swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04.tar.gz \
  && tar xzvf swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04.tar.gz \
  && rm swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04.tar.gz

export PATH $/root/swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04/usr/bin:$PATH

swiftc -h

#Hack to force usage of the gold linker
rm /usr/bin/ld && ln -s /usr/bin/ld.gold /usr/bin/ld

# Clone and install swift-corelibs-libdispatch
 git clone -b experimental/foundation https://github.com/apple/swift-corelibs-libdispatch.git \
  && cd swift-corelibs-libdispatch \
  && git submodule init \
  && git submodule update \
  && sh ./autogen.sh \
  && CFLAGS=-fuse-ld=gold ./configure --with-swift-toolchain=$/root/swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04/usr --prefix=$/root/swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a-ubuntu14.04/usr \
  && make \
  && make install
