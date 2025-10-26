#!/bin/bash
cd /app
export PYTHONPATH=/app:$PYTHONPATH
export DJANGO_SETTINGS_MODULE=SkinDisease.settings
export DEBUG=True
export ALLOWED_HOSTS=*
python manage.py runserver 0.0.0.0:8000
