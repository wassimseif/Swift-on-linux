
function printer(){
  echo "***************************"
  echo $1
  echo "***************************"
}
printer "Updating and Upgrading"

sudo apt-get update &&  sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get install git 
printer "Installing LLVM repo."

wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" >>  /etc/apt/sources.list 

printer "Install dependencies"
sudo apt-get update && apt-get install -y \
  automake \
  build-essential \
  curl \
  clang-3.8 \
  libblocksruntime-dev \
  libbsd-dev \
  libglib2.0-dev \
  libpython2.7 \
  libicu-dev \
  libkqueue-dev \
  libcurl4-openssl-dev \
  libtool \
  lsb-core \
  openssh-client \
  vim \
  wget \
  binutils \
  binutils \
  libcurl4-openssl-dev \
  openssl \
  libssl-dev \
  autoconf \
  pkg-config \
  systemtap-sdt-dev 

 printer "Setting Default LLVM to 3.8"
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100

printer "Installing Swift Compiler"
  # Install Swift compiler
wget https://swift.org/builds/swift-3.0-release/ubuntu1404/swift-3.0-RELEASE/swift-3.0-RELEASE-ubuntu14.04.tar.gz \
  && tar xzvf swift-3.0-RELEASE-ubuntu14.04.tar.gz \
  && rm swift-3.0-RELEASE-ubuntu14.04.tar.gz

export PATH=/root/swift-3.0-RELEASE-ubuntu14.04/usr/bin:$PATH

echo "export PATH=/root/swift-3.0-RELEASE-ubuntu14.04/usr/bin:$PATH" >> /root/.bashrc
printer "Testing Swift Compiler"
swiftc -h
printer "Configuring Golden Linker"
rm /usr/bin/ld && ln -s /usr/bin/ld.gold /usr/bin/ld

printer "Installing Dispatch"
git clone  https://github.com/apple/swift-corelibs-libdispatch.git \
 && cd swift-corelibs-libdispatch \
 && git submodule init \
 && git submodule update \
 && sh ./autogen.sh \
 && ./configure \
 && make \
 && make install
