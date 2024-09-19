#!/bin/bash

# collect static files and migrate
python manage.py collectstatic --noinput
python manage.py migrate
python manage.py initadmin