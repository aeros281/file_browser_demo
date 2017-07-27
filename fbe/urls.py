from django.conf.urls import url

from .views import HomePageView, get_root_folder_info, serve_file

urlpatterns = [
    url(r'^$', HomePageView.as_view(), name='index'),
    url(r'^api/getroot/$', get_root_folder_info, name='get_root_folder_info'),
    url(r'^api/getroot/$', get_root_folder_info, name='get_root_folder_info'),
    url(r'^api/getfile/$', serve_file, name='get_file'),
]
