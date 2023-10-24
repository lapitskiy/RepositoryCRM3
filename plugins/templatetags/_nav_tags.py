from django import template

register = template.Library()

@register.inclusion_tag('../templates/include/_nav.html', takes_context=True)
def navigation(context):
    return context

