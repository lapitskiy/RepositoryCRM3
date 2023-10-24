from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .forms import PluginsForm, SettingsCategoryAddForm
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, CreateView, TemplateView
from django.urls import reverse_lazy

from .models import Plugins, Category

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger

@method_decorator(login_required, name='dispatch')
class ViewPlugins(ListView):
    model = Plugins
    template_name = 'plugins/plugins_list.html'
    context_object_name = 'plugins'

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


class SettingsView(ListView):
    #model = Orders
    paginate_by = 10
    template_name = 'settings/plugins_settings_list.html'

    def get_queryset(self):
        return self.getQuery()

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Настройки'
        context['filter'] = self.requestGet('filter')
        # filter
        list_orders = self.getQuery()
        #paginator
        paginator = Paginator(list_orders, self.paginate_by)
        page = self.request.GET.get('page')
        try:
            orders_page = paginator.page(page)
        except PageNotAnInteger:
            page = 1
            orders_page = paginator.page(page)
        except EmptyPage:
            orders_page = paginator.page(paginator.num_pages)

        if self.request.GET.get('model'):
            context.update({'model': self.request.GET.get('model')})
        else:
            context.update({'model': 'service'})
        #print('context ', context['model'])
        #print('context ', context)
        return context

    def post(self, request, *args, **kwargs):
        return super(OrdersSettingsView, self).post(request, *args, **kwargs)

    def requestGet(self, req):
        if self.request.GET.get(req):
            return ''
        else:
            return ''

    def getQuery(self):
        model = self.request.GET.get('model')
        filter_q = self.request.GET.get('filter')
        if model and not filter_q:
            if model == 'category':
                return Category.objects.all()

        if filter_q and model:
            if model == 'category':
                return Service.objects.filter(Q(name__icontains=filter_q))
            if model == 'category_service':
                return Category_service.objects.all()
        return Category.objects.all()

    def requestGet(self, req):
        if self.request.GET.get(req):
            return self.request.GET.get('filter')
        else:
            return ''

class SettingsAddView(TemplateView):
    template_name = 'settings/settings_add.html'

    def get(self, request, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        formAdd = self.getForm()
        formAdd.prefix = 'add_form'
        context.update({'formAdd': formAdd})
        context.update({'model': self.request.GET.get('model')})
        return self.render_to_response(context)


    def post(self, request, *args, **kwargs):
        formAdd = self.getPostForm(self.request.POST)
        if formAdd.is_valid():
            form_update = formAdd.save(commit=False)
            form_update.save()
            #print('Valid')
            return HttpResponseRedirect(reverse_lazy('order_settings') + '?model=' + self.request.GET.get('model'))
        else:
            #print('NotValid')
            return self.form_invalid(formAdd, **kwargs)

    def getForm(self):
        getadd = self.request.GET.get('model')
        if getadd:
            if 'category' in getadd:
                return SettingsCategoryAddForm

    def getPostForm(self, req):
        getadd = self.request.GET.get('model')
        if getadd:
            if 'category' in getadd:
                return SettingsCategoryAddForm(req, prefix='add_form')


    def form_invalid(self, formAdd, **kwargs):
        context = self.get_context_data()
        formAdd.prefix = 'add_form'
        context.update({'formAdd': formAdd})
        context['model'] = self.request.GET.get('model')
        return self.render_to_response(context)

class SettingsEditView(TemplateView):
    template_name = 'settings/settings_edit.html'

    def get(self, request, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        formEdit = self.getForm()
        formEdit.prefix = 'edit_form'
        context.update({'formEdit': formEdit})
        context.update({'model': self.request.GET.get('model')})
        context.update({'id': self.request.GET.get('id')})
        return self.render_to_response(context)

    def post(self, request, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        formEdit = self.getPostForm()
        if formEdit.is_valid():
            if self.request.GET.get('model') == 'status':
                if formEdit.cleaned_data['fast_closed']:
                    dd = {'fast_closed': False}
                    Status.objects.all().update(**dd)
            formEdit.save()
            return HttpResponseRedirect(reverse_lazy('order_settings') + '?model=' + self.request.GET.get('model'))
        else:
            return self.form_invalid(formEdit, **kwargs)

    def form_invalid(self, formEdit, **kwargs):
        context = self.get_context_data()
        formEdit.prefix = 'edit_form'
        context.update({'formEdit': formEdit})
        context.update({'model': self.request.GET.get('model')})
        context.update({'id': self.request.GET.get('id')})
        return self.render_to_response(context)

    def getForm(self):
        getmodel = self.request.GET.get('model')
        if getmodel:
            if getmodel == 'category':
                get_id = Category.objects.get(pk=self.request.GET.get('id'))
                return SettingsCategoryAddForm(instance=get_id)


    def getPostForm(self):
        getedit = self.request.GET.get('model')
        if getedit:
            if getedit == 'category':
                get_id = Category.objects.get(pk=self.request.GET.get('id'))
                return SettingsCategoryAddForm(self.request.POST, prefix='edit_form', instance=get_id)
