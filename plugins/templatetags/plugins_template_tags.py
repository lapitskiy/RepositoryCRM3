from django import template
from django.utils.html import mark_safe
from django.http import HttpRequest

register = template.Library()

@register.simple_tag
def url_replace(req, **kwargs):
    query = req.GET.copy()
    for kwarg in kwargs:
        try:
            query.pop(kwarg)
        except KeyError:
            pass
    query.update(kwargs)
    return mark_safe(query.urlencode())