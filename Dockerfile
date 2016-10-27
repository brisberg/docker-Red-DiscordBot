FROM python:latest

MAINTAINER Brandon Risberg <brandon.risberg@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  libav-tools \
  libffi-dev \
  libopus-dev \
  libssl-dev \
  unzip \
&& apt-get clean

RUN pip install \
  git+https://github.com/Rapptz/discord.py@master#egg=discord.py[voice] \
  imgurpython \
  youtube_dl

RUN git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git /app

VOLUME /app/data
WORKDIR /app

CMD ["python", "./red.py", "--no-prompt"]
