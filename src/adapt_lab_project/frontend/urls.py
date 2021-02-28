from django.conf.urls import url
from .views import Docpage

urlpatterns = [
    url('doc/', Docpage.as_view()),
]
