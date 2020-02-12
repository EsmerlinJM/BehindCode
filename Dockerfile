FROM ubuntu:bionic

RUN apt-get update && apt-get install \
  -y --no-install-recommends python3 python3-virtualenv

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv

# Install dependencies:
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN . /opt/venv/bin/activate && pip install -r requirements.txt

# Run the application:
COPY . /app
CMD . /opt/venv/bin/activate && exec python manage.py runserver --host=0.0.0.0