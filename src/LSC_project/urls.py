from django.conf.urls import patterns, include, url
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',

                       url(r'^$', 'Login.views.login_user', name='login_user'),
                       url(r'^login/$', 'Login.views.login_user', name='login'),
                       url(r'^dashboard/$', 'Dashboard.views.home', name='dashboard'),
                       # url(r'^ts/(?P<result_name>)', 'TimeSheetApp.views.time_page', name="time_page"),


                       url(r'^ts/(.{36})', 'TimeSheetApp.views.time_page', name='time_page'),
                       # url(r'^ts/[.*]/$', 'TimeSheetApp.views.time_page', name="time_page"),
                                            # Admin

                       url(r'^logout/$', 'Dashboard.views.logout', name="logout"),

                       url(r'^admin/', include(admin.site.urls)),

                       )
