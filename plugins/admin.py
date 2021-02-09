from django.contrib import admin

from .models import Plugins, Category
# Register your models here.

class PluginsAdmin(admin.ModelAdmin):
    list_display = ('id','title','category','updated_at','is_active')
    list_display_links = ('id','title')
    search_fields = ('title','content')
    list_editable = ('is_active',)
    list_filter = ('is_active','category')

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id','title')
    list_display_links = ('id','title')
    search_fields = ('title',)

admin.site.register(Plugins, PluginsAdmin)
admin.site.register(Category, CategoryAdmin)