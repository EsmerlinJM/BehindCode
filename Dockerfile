# Builder
FROM python:3.7.2-alpine AS flask

# Install and update dependencies for g++
RUN apk add --update --no-cache \
    g++

# Create workdir
WORKDIR /home/app/src
ADD . /home/app/src

# Add, update and install dependencies
COPY requirements.txt /tmp/
RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/

# Runtime
FROM nginx:1.17.4-alpine AS nginx
ADD nginx.conf /etc/nginx/conf.d/default.conf