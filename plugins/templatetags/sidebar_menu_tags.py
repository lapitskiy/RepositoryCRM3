from django import template

register = template.Library()

@register.inclusion_tag('settings/sidebar_menu_settings_tags.html')
def show_settings_menu():
    pass
    #categories = Category.objects.annotate(cnt=Count('get_category')).filter(cnt__gt=0)
    return
