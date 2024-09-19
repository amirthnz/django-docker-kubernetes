# -----------------------------------------------------------------------------
# This file contains settings specific to the production environment,
# such as disabling debug mode, configuring the production database,
# and other production-related settings.
# -----------------------------------------------------------------------------

import os
from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

# TODO: Update this to match your domain(s)
ALLOWED_HOSTS = [
    '37.32.11.131',
    '127.0.0.1',
    'easeusinfo.us-east-1.log.aliyuncs.com'
]

# Use a more secure secret key in production
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

# TODO: Add below lines after domain is submitted
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
# SECURE_SSL_REDIRECT = True
# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True
# SECURE_BROWSER_XSS_FILTER = True
# SECURE_HSTS_SECONDS = 31536000
# SECURE_HSTS_INCLUDE_SUBDOMAINS = True
# SECURE_HSTS_PRELOAD = True
# SECURE_CONTENT_TYPE_NOSNIFF = True
