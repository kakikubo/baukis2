FROM kakikubo/rails6-deps:latest

ARG UID=1000
ARG GID=1000

# RUN mkdir -p /var/mail
RUN getent group $GID || groupadd -g $GID devel
RUN id -u $UID || useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /tmp
COPY ./Gemfile /tmp/Gemfile
COPY ./Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

COPY . /apps

RUN apk add --no-cache openssl libsass

USER devel

RUN openssl rand -hex 64 > /home/devel/.secret_key_base
RUN echo $'export SECRET_KEY_BASE=$(cat /home/devel/.secret_key_base)' \
  >> /home/devel/.bashrc

WORKDIR /apps
