FROM python:3.6
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install --no-install-recommends -y \
  bash-completion \
  && rm -rf /var/lib/apt/lists/*
RUN echo 'source /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && rm -rf /root/.cache

ARG TINI_VERSION=v0.16.1
RUN curl -SL \
  https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini \
  -o /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
