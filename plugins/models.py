from django.db import models
from django.urls import reverse

# Create your models here.
def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    name = filename.find('.')
    return 'file/{0}/{1}/'.format(filename[:name],filename)

class Plugins(models.Model):
    title = models.CharField(max_length=150, verbose_name='Название')
    module_name = models.CharField(max_length=150, blank=True, verbose_name='Имя модуля')
    description = models.TextField(blank=True, verbose_name='Описание')
    version = models.IntegerField(default=1, verbose_name='Версия')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Обновлен')
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/', blank=True, verbose_name='Фото')
    zipfile = models.FileField(upload_to=user_directory_path, blank=True, verbose_name='Файл')
    is_active = models.BooleanField(default=True, verbose_name='Активирован')
    category = models.ForeignKey('Category', on_delete=models.PROTECT, verbose_name='Категория', related_name='get_category')
    loads = models.IntegerField(default=0)
    related_class_name = models.CharField(max_length=150, blank=True, verbose_name='Имя класса для связи')


    def get_absolute_url(self):
        return reverse('urls_view_current_plugins', kwargs={'pk': self.pk})



    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Плагин'
        verbose_name_plural = 'Плагины'
        ordering = ['title']



class Category(models.Model):

    title = models.CharField(max_length=150, db_index=True, verbose_name='Наименования категории')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'
        ordering = ['title']


