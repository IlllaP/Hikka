FROM python:3.8-slim as python-base
ENV DOCKER=true
ENV GIT_PYTHON_REFRESH=quiet

ENV PIP_NO_CACHE_DIR=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN apt update && apt install -y --no-install-recommends libcairo2 git build-essential && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
RUN apt update && apt install git curl neofetch -y
WORKDIR /hikka
RUN git clone https://github.com/IlllaP/Hikka .

RUN pip install --no-warn-script-location --no-cache-dir -U -r requirements.txt

EXPOSE 8080
RUN mkdir /data
CMD python -m hikka
