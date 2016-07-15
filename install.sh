 
  cd /root
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
  libcurl4-gnutls-dev \
  libcurl3 \
  libglib2.0-dev \
  libpython2.7 \
  libicu-dev \
  libkqueue-dev \
  libtool \
  openssh-client \
  wget \
  && rm -rf /var/lib/apt/lists/*
  export PATH=/root/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10/usr/bin:$PATH

  wget -nv https://swift.org/builds/development/ubuntu1510/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10.tar.gz \
  && tar xzvf swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10.tar.gz \
  && rm swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10.tar.gz

  export PATH=/root/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10/usr/bin:$PATH  


  swiftc -h  


git clone -b experimental/foundation https://github.com/apple/swift-corelibs-libdispatch.git \
  && cd swift-corelibs-libdispatch \
  && git submodule init \
  && git submodule update \
  && sh ./autogen.sh \
  && ./configure --with-swift-toolchain=/root/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10/usr --prefix=/root/swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a-ubuntu15.10/usr \
  && make \
  && make install



  