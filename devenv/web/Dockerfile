# ビルド用コンテナ
ARG IMAGE_FILE
FROM $IMAGE_FILE:3.2.1-alpine3.17 AS builder
RUN apk --no-cache add --virtual build-dependencies \
    build-base \
    git \
    make \
    gcc \
    g++ \
    gcompat \
    zlib-dev \
    libffi-dev \
    readline-dev \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev
RUN apk --no-cache add \
    bash \
    yarn \
    postgresql-client \
    imagemagick \
    tzdata
ENV APP_PATH /work/app
WORKDIR $APP_PATH

COPY Gemfile $APP_PATH
COPY Gemfile.lock $APP_PATH
RUN gem update bundler \
    && bundle config set force_ruby_platform true \
    && bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3 \
    && apk del build-dependencies # --virtual でグルーピングしたpackageを削除
RUN rm -rf /usr/local/bundle/cache/*

# mainコンテナ
#    ${BROWSER} \

FROM ${IMAGE_FILE}:3.2.1-alpine3.17
#RUN if [ "$IMAGE_FILE" = "arm64v8/ruby" ] ; then export BROWSER=google-chrome-stable ; else export BROWSER=firefox-esr ;fi && \
    RUN apk --no-cache add \
    build-base \
    bash \
    file \
    make \
    curl \
    gcompat \
    gcc \
    libffi-dev \
    yarn \
    readline-dev \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    postgresql-dev \
    postgresql-client \
    nodejs \
    npm \
    imagemagick  \
    tzdata
#RUN cd /tmp && \
#    curl -O http://chromedriver.storage.googleapis.com/100.0.4896.20/chromedriver_linux64.zip && \
#    unzip chromedriver_linux64.zip && mv chromedriver /usr/local/bin \
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
#    && pip3 install --upgrade pip \
#    && pip3 install -U selenium
# TZ JST
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#RUN cd \
#    && wget https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
#    && mkdir -p /usr/share/fonts/noto \
#    && unzip NotoSerifCJKjp-hinted.zip -d /usr/share/fonts/noto \
#    && rm NotoSerifCJKjp-hinted.zip \
#    && fc-cache -fv
ENV APP_PATH /work/app
WORKDIR $APP_PATH
COPY . $APP_PATH
COPY --from=builder /usr/local/bundle /usr/local/bundle
RUN npm update

CMD ["bin/rails", "s"]
