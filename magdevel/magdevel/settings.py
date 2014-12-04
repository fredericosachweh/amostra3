# -*- coding: utf-8 -*-
"""
Django settings for mag_core_project project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import socket
import mongoengine



HOST_NAME = socket.gethostbyname(socket.gethostname())
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# general
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SITE_ROOT = os.path.dirname(PROJECT_ROOT)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+n$*1=)6%(#ctian27e07@^5-bhs#c9=xdc68f=vu^ygc&s6#8k'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

# admins and managers
ADMINS = (
    ('Giancarlo Razzolini', 'gian@magtab.com'),
    ('Giancarlo Rubio', 'rubio@magtab.com'),
)
MANAGERS = ADMINS

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['*']

TEMPLATE_CONTEXT_PROCESSORS = (
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.debug",
    "django.core.context_processors.i18n",
    "django.core.context_processors.media",
    "django.core.context_processors.static",
    "django.core.context_processors.tz",
    "django.contrib.messages.context_processors.messages",
    "django.core.context_processors.request",
)

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.gis',
    'django_extensions',
    'rest_framework',
    'rest_framework.authtoken',
    'autocomplete_light',
    'cities_light',
    'localflavor',
    'reversion',
    'password_reset',
    'magad',
    'magcore.log',
    'magcore.identify',
    'magcore.device',
    'magcore.publisher',
    'magcore.company',
    'magcore.configuration',
    'magcore.app',
    'magcore.accounts',
    'magcore.aws',
    'corsheaders',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django_user_agents.middleware.UserAgentMiddleware',
)
CORS_ORIGIN_ALLOW_ALL=True

ROOT_URLCONF = 'magdevel.urls'

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'admag',
        'USER': 'admag',
        'PASSWORD': 'n43k650s013j43',
        'HOST': 'admag.cm5ca3zkxqlg.sa-east-1.rds.amazonaws.com'
    }

}


mongoengine.connect("admag")
MONGO_CLIENT_URL = 'mongodb://localhost:27017'

SESSION_ENGINE = 'mongoengine.django.sessions'
#AUTHENTICATION_BACKENDS = (
    #'mongoengine.django.auth.MongoEngineBackend',
#)

POSTGIS_VERSION = ( 2, 1 )

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

# STATIC SETTINGS AWS
AWS_STATIC_BUCKET_NAME = 'static.admag.com.br'
AWS_STATIC_CUSTOM_DOMAIN = 'd1g3swsxeb66x1.cloudfront.net'

STATICFILES_STORAGE = 'magcore.aws.s3.storage.StaticStorage'
STATIC_ROOT = os.path.join(SITE_ROOT, 'static')
STATIC_URL = 'https://{}/'.format(AWS_STATIC_CUSTOM_DOMAIN)
STATICFILES_DIRS = (
    os.path.join(PROJECT_ROOT, 'static'),
    os.path.join(PROJECT_ROOT, 'magcore/static'),
)

# S3 KEYS
S3_ACCESS_KEY_ID = 'AKIAIHGAT5XEG7W4JVVA'
S3_SECRET_ACCESS_KEY = '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'

# MEDIA SETTINGS
AWS_MEDIA_BUCKET_NAME = 'media.admag.com.br'
AWS_MEDIA_CUSTOM_DOMAIN = 'd29u39lgq6x9m.cloudfront.net'
MEDIA_FILE_STORAGE = 'magcore.aws.s3.storage.MediaStorage'

DEFAULT_FILE_STORAGE = MEDIA_FILE_STORAGE
MEDIA_ROOT = os.path.join(SITE_ROOT, 'media')
MEDIA_URL = 'https://{}/'.format(AWS_MEDIA_CUSTOM_DOMAIN)
TEMP_DIR = os.path.join(MEDIA_ROOT, 'tmp')


# Django cache settings
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.PyLibMCCache',
        'LOCATION': '127.0.0.1:11211'
    },
    'staticfiles': {
        'BACKEND': 'django.core.cache.backends.memcached.PyLibMCCache',
        'LOCATION': '127.0.0.1:11211',  # Like 127.0.0.1:11211
        'TIMEOUT': 2592000, # Default is one month
    }
}


TEMPLATE_DIRS = (
    os.path.join(BASE_DIR,  'templates'),
    os.path.join(BASE_DIR,  'magcore/templates'),
)

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.TokenAuthentication',
    ),
    'DEFAULT_FILTER_BACKENDS': (
        'rest_framework.filters.DjangoFilterBackend',
        'rest_framework.filters.SearchFilter',
    ),
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'PAGINATE_BY': 10,
    'TEST_REQUEST_DEFAULT_FORMAT': 'json',
    'URL_FIELD_NAME': 'self',
    'EXCEPTION_HANDLER': 'magdevel.custom_exception_handler'
}

AUTH_USER_MODEL = 'accounts.User'
LOGIN_URL = '/'

PUBLISHER_INTEREST_CATEGORY_MODEL = 'magad.InterestCategory'
PUBLISHER_INTEREST_CHANNEL_MODEL = 'magad.InterestChannel'
PUBLISHER_INTEREST_CHANNEL_CATEGORY_MODEL = 'magad.InterestChannelCategory'
PUBLISHER_PUBLISHER_MODEL = 'magad.Publisher'
PUBLISHER_PUBLICATION_MODEL = 'magad.Publication'
PUBLISHER_ISSUE_MODEL = 'magad.Issue'
PUBLISHER_PAGE_MODEL = 'magad.Page'
APP_DEVICE_APP_MODEL = 'magad.DeviceApp'
APP_APP_MODEL = 'magad.App'
LOG_DEVICE_LOG_MODEL = 'magad.DeviceLog'
LOG_ERROR_JS_MODEL = 'magad.LogErrorJS'
PUBLISHER_DEVELOPER_MODEL = 'magad.Developer'

DEVICE_SYSTEM_IOS='iOS'
DEVICE_SYSTEM_ANDROID='Android'

FILE_UPLOAD_HANDLERS = (
    "django.core.files.uploadhandler.TemporaryFileUploadHandler",
)


if DEBUG:
    STATIC_URL = '/static/'
    STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.StaticFilesStorage'
    EMAIL_HOST = '127.0.0.1'
    EMAIL_HOST_USER = ''
    EMAIL_HOST_PASSWORD = ''
    EMAIL_PORT = 1025
    EMAIL_USE_TLS = False

try:
    from magdevel.local_settings import *
except:
    pass
