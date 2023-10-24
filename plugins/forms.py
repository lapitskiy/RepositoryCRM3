from django import forms
from .models import Plugins, Category
#from uploads.core.models import Plugins
import re
from django.core.exceptions import ValidationError


class PluginsForm(forms.ModelForm):
    class Meta:
        model = Plugins
        #fields = '__all__'

        fields = ['title', 'description', 'module_name', 'photo', 'zipfile', 'is_active', 'category']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 5}),
            'module_name': forms.TextInput(attrs={'class': 'form-control'}),
            'category': forms.Select(attrs={'class': 'form-control'}),
        }

    def clean_title(self):
        title = self.cleaned_data['title']
        if re.match(r'\d', title):
            raise ValidationError('Название не должно начинаться с цифры')
        return title

class SettingsCategoryAddForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['title',]
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control', 'autocomplete': 'off'}),
        }

    def clean_title(self):
        name = self.cleaned_data['title']
        if re.match(r'\d', name):
            raise ValidationError('Название не должно начинаться с цифры')
        if not name[0].isupper():
            raise ValidationError('Название не должно начинаться с маленькой буквы')
        return name