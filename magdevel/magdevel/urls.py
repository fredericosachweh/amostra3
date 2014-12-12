# -*- coding: utf-8 -*-
from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.core.urlresolvers import reverse
from django.views.generic import RedirectView
from django.views.generic import TemplateView

urlpatterns = patterns('',
    # Examples:
    url(r'^', include('magcore.accounts.urls', namespace='accounts')),
    #url(r'^', TemplateView.as_view(template_name="base.html")),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^configuration/', include('magcore.configuration.urls')),
    url(r'^device/', include('magcore.device.urls')),
    url(r'^geo/', include('magcore.geo.urls')),
    url(r'^publisher/', include('magcore.publisher.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^magad/', include('magad.urls')),
    url(r'', include('autocomplete_light.urls')),
) + static('/media/', document_root=settings.MEDIA_ROOT)

