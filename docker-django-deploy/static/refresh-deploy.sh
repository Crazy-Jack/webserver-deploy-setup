supervisorctl restart all
yes yes | python3 /home/docker/code/app/manage.py collectstatic -h
