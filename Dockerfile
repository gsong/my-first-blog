FROM python:3-alpine
ENV PYTHONUNBUFFERED 1

RUN echo $'source /usr/share/bash-completion/bash_completion\n\
export HISTFILE=$HOME/.bash_history/history\n\
PS1=\'\u@\h:\w$ \''\
>> /root/.bashrc

RUN apk add --update --no-cache \
  bash \
  bash-completion \
  curl \
  git \
  make \
  sqlite \
  tree

RUN mkdir -p /etc/bash_completion.d
RUN cd /etc/bash_completion.d/ \
  && curl -SLO https://cdn.jsdelivr.net/gh/django/django@stable/2.1.x/extras/django_bash_completion

WORKDIR /root/src/djangogirls
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && rm -rf /root/.cache
