from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'magdevel.views.home', name='home'),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^device/', include('magcore.device.urls')),
    url(r'^geo/', include('magcore.geo.urls')),
    url(r'^publisher/', include('magcore.publisher.urls')),
    url(r'^accounts/', include('magcore.accounts.urls', namespace='accounts')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^magad/', include('magad.urls')),
    url(r'', include('autocomplete_light.urls')),
) + static('/media/', document_root=settings.MEDIA_ROOT)

