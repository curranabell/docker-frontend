FROM mhart/alpine-node

MAINTAINER Andy Postnikov

RUN apk add --no-cache \
  libstdc++ tzdata bash \
  git gcc g++ make \
  openssl-dev readline-dev zlib-dev

#RUN npm install gulp -g

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
  && cd ~/.rbenv && src/configure && make -C src

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /etc/profile

#RUN apk del git gcc g++ make
RUN rm -rf /tmp/*

#RUN gem install bundler --no-ri --no-rdoc
