# -*- coding: utf-8 -*-
from magdevel import settings

__author__ = 'frederico'
import traceback
import logging
from rest_framework.views import exception_handler

logger = logging.getLogger(__name__)

def custom_exception_handler(exc):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    response = exception_handler(exc)

    # Now add the HTTP status code to the response.
    if response is not None:
        response.data['status_code'] = response.status_code
    else:
        if settings.DEBUG:
            logger.error(traceback.format_exc())

    return response