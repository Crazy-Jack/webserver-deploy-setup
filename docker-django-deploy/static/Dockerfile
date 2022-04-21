FROM ubuntu:18.04

MAINTAINER Dockerfiles
ARG appname=cirDraw

RUN apt-get update && apt-get upgrade -y && apt-get install -y git python3 python3-dev python3-setuptools python3-pip nginx supervisor sqlite3 && pip3 install -U pip setuptools
ADD django-conf/dependencies.sh /tmp/dependencies.sh
RUN bash /tmp/dependencies.sh
RUN rm -rf /var/lib/apt/lists/*

RUN pip install uwsgi
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY static/nginx-app.conf /etc/nginx/sites-available/default
COPY django-conf/supervisor.conf /etc/supervisor/conf.d/
COPY django/$appname /home/docker/code/app/
RUN pip install -r /home/docker/code/app/requirements.txt
COPY static /home/docker/code/
RUN echo "module=$appname.wsgi:application" >> /home/docker/code/uwsgi.ini
RUN python3 /home/docker/code/app/manage.py collectstatic --h
RUN mkdir -p /home/docker/persistent/media
EXPOSE 80
CMD ["supervisord", "-n"]
