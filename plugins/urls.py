from django.urls import path
from .views import *
from rest_framework import routers
from .api import PluginApiViewSet

router = routers.DefaultRouter()
router.register('plugins/api', PluginApiViewSet, 'plugins')

urlpatterns = [
    path('', ViewPlugins.as_view(), name='view_plugins'),
    path('plugins/<int:pk>/', ViewCurrentPlugins.as_view(), name='urls_view_current_plugins'),
    path('plugins/add-plugins/', CreatePlugins.as_view(), name='add_plugins'),
    path('settings/', SettingsView.as_view(), name='plugins_settings'),
    path('settings/add/', SettingsAddView.as_view(), name='plugins_settings_add'),
    path('settings/edit/', SettingsEditView.as_view(), name='plugins_settings_edit'),
]

urlpatterns += router.urls