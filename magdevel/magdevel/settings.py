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

HOST_NAME = socket.gethostbyname(socket.gethostname())
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+$*1=)6%(#cthiw7e07@^5-bhs#c9=xdnc68f=vu^ygc&s6#8k'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


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
    'corsheaders'
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
        'NAME': 'magdevel_db',
        'USER': 'user',
        'PASSWORD': 'user',
        'HOST': 'localhost'
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
    os.path.join(BASE_DIR, 'magcore/static'),
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

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
    'URL_FIELD_NAME': 'self'
}

AUTH_USER_MODEL = 'accounts.User'

if DEBUG:
    EMAIL_HOST = '127.0.0.1'
    EMAIL_HOST_USER = ''
    EMAIL_HOST_PASSWORD = ''
    EMAIL_PORT = 1025
    EMAIL_USE_TLS = False

PUBLISHER_INTEREST_CATEGORY_MODEL = 'magad.InterestCategory'
PUBLISHER_INTEREST_CHANNEL_MODEL = 'magad.InterestChannel'
PUBLISHER_INTEREST_CHANNEL_CATEGORY_MODEL = 'magad.InterestChannelCategory'
PUBLISHER_PUBLISHER_MODEL = 'magad.Publisher'
PUBLISHER_PUBLICATION_MODEL = 'magad.Publication'
PUBLISHER_ISSUE_MODEL = 'magad.Issue'
PUBLISHER_PAGE_MODEL = 'magad.Page'
APP_DEVICE_APP_MODEL = 'magad.DeviceApp'
APP_APP_MODEL = 'magad.App'

FILE_UPLOAD_HANDLERS = (
    "django.core.files.uploadhandler.TemporaryFileUploadHandler",
)

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

if HOST_NAME == '10.203.163.169':
    MEDIA_URL = 'http://sdk-teste.admag.com.br/media/'
else:
    MEDIA_URL = 'http://' + HOST_NAME + ':8000/media/'