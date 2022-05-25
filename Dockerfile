FROM ubuntu AS builder

RUN apt update -y \
  && DEBIAN_FRONTEND=noninteractive apt install -y git autoconf pkg-config automake libtool m4 make

RUN apt install -y linux-headers-generic linux-headers-$(uname -r)

RUN git clone https://git.netfilter.org/libmnl /tmp/fullcone/libmnl \
  && cd /tmp/fullcone/libmnl \
  && ./autogen.sh \
  && ./configure \
  && make && make install

RUN git clone https://git.netfilter.org/libnftnl /tmp/fullcone/libnftnl \
  && cd /tmp/fullcone/libnftnl \
  && ./autogen.sh \
  && ./configure \
  && make && make install

RUN git clone https://github.com/Chion82/netfilter-full-cone-nat /tmp/fullcone/netfilter-full-cone-nat \
  && cd /tmp/fullcone/netfilter-full-cone-nat \
  && make 


