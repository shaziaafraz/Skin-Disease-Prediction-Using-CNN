#!/usr/bin/env python
import os
import sys

# Set environment variables for development
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'SkinDisease.settings')
os.environ['DEBUG'] = 'True'
os.environ['ALLOWED_HOSTS'] = 'localhost,127.0.0.1,0.0.0.0'

try:
    from django.core.management import execute_from_command_line
except ImportError as exc:
    raise ImportError(
        "Couldn't import Django. Are you sure it's installed and "
        "available on your PYTHONPATH environment variable? Did you "
        "forget to activate a virtual environment?"
    ) from exc

if __name__ == '__main__':
    execute_from_command_line(sys.argv)
