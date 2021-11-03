FROM ruby:3.0.2

ARG uid
ARG app_path
ENV BUNDLE_PATH=$app_path/.gems BUNDLE_JOBS=3

RUN apt-get update && \
      apt-get install -yqq --no-install-recommends nodejs

RUN useradd -u $uid --home-dir $app_path aulas-back

USER aulas-back

WORKDIR $app_path
