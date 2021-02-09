from rest_framework import serializers
from .models import Plugins

class PluginSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plugins
        fields = '__all__'
