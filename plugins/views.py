from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .forms import PluginsForm
from django.views.generic import ListView, DetailView, CreateView
from django.urls import reverse_lazy

from .models import Plugins, Category

class ViewPlugins(ListView):
    model = Plugins
    template_name = 'plugins/plugins_list.html'
    context_object_name = 'plugins'
    #allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Главная страница'
        return context

    def get_queryset(self):
        return Plugins.objects.filter(is_active=True)


class ViewCurrentPlugins(DetailView):
    model = Plugins
    template_name = 'plugins/plugins_item.html'
    context_object_name = 'plugins_item'


class CreatePlugins(CreateView):
    form_class = PluginsForm
    template_name = 'plugins/add_plugins.html'
