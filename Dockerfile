FROM python:3-alpine

ENV APP_ROOT /app
WORKDIR $APP_ROOT
EXPOSE 8080/tcp

RUN apk add --no-cache --virtual .build-deps \
        gcc musl-dev libffi-dev


COPY ./requirements.txt /tmp
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt && apk del .build-deps

COPY . $APP_ROOT
CMD ['python', 'scout.py']

