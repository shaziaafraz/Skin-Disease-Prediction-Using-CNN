#!/bin/bash
cd /app
export DJANGO_SETTINGS_MODULE=SkinDisease.settings
export DEBUG=True
export ALLOWED_HOSTS=*
PYTHONPATH=/app python manage.py runserver 0.0.0.0:8000
