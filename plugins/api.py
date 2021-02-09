from .models import Plugins
from rest_framework import viewsets, permissions
from .serializers import PluginSerializer

class PluginApiViewSet(viewsets.ModelViewSet):
    queryset = Plugins.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = PluginSerializer

