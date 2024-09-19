# -----------------------------------------------------------------------------
# This file contains settings specific to the development environment,
# such as enabling debug mode, using a local database, and
# configuring other development-related settings.
# -----------------------------------------------------------------------------

from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1']