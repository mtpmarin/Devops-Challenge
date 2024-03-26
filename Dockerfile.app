FROM python:3.9.19-alpine

WORKDIR /var/www/app

COPY ./app .

RUN pip3 install -r requirements.txt

RUN apk update && apk add py3-gunicorn

CMD gunicorn --log-level debug -b 0.0.0.0:8000 api:app
