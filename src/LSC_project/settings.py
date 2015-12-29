"""
Django settings for LSC_project project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# PROJECT_PATH = os.path.realpath(os.path.dirname(__file__))



# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'r(q@hh)pa^i8miukp&x3_kx@x+_x-z0w7koxqz7czt&28sz6&2'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []
# Allowed hosts is for when the app goes live.website https://www.youtube.com/watch?v=WP3Lrz-4uS8

INSTALLED_APPS = (

    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'Login',
    'Dashboard',
    'TimeSheetApp',
)

# LOGIN_URL = '/login/'

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
 #   'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

)


TEMPLATE_CONTEXT_PROCESSORS = (
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.request",
)

ROOT_URLCONF = 'LSC_project.urls'

WSGI_APPLICATION = 'LSC_project.wsgi.application'


# Database

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'LSC_db',
        'USER': 'root',
        'PASSWORD': 'pass123',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}

# Internationalization

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

# supposing you put it in apps/profiles/models.py

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(os.path.dirname(BASE_DIR), "static", "static",),
)

TEMPLATE_DIRS = (
    os.path.join(os.path.dirname(BASE_DIR), "static", "templates"),
)

