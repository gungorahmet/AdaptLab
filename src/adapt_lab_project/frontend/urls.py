from django.conf.urls import url
from .views import DocPage, DashboardPage

urlpatterns = [
    url('doc/', DocPage.as_view()),
    url('dashboard/', DashboardPage.as_view())
]
