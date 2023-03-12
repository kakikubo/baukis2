# FROM selenium/standalone-chrome:latest
ARG CHROME_IMAGE
FROM ${CHROME_IMAGE}:latest
LABEL authors=SeleniumHQ
USER root
#=================
# Locale settings
#=================
ENV LANGUAGE ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
RUN if [ ${CHROME_IMAGE} = "selenium/standalone-chrome" ] ; then locale-gen ja_JP.UTF-8 \
  && dpkg-reconfigure --frontend noninteractive locales \
  && apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
  language-pack-ja \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \; \
  else apt-get update -qqy \
  && apt-get -qqy install task-japanese locales-all \
  ; fi


USER seluser
EXPOSE 5900
