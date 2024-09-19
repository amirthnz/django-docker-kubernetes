#!/bin/sh

while ! nc -z db 3306 ; do
    echo "Waiting for the MySQL Server"
    sleep 3
done
python manage.py collectstatic --noinput
python manage.py migrate
python manage.py initadmin
exec "$@"

