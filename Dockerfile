# Builder
FROM python:3.7.2-alpine AS flask

RUN apk add --update --no-cache \
    python \
    make \
    g++

WORKDIR /app
ADD . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "--bind", ":5000" , "manage:app"]

# Runtime
FROM nginx:1.17.4-alpine AS nginx

ADD nginx.conf /etc/nginx/conf.d/default.conf

