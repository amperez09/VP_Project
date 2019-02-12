from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('proyecto/',views.proyecto, name="proyecto"),
    path('add_proyecto/',views.add_proyecto, name="add_proyecto"),
    path('mod_proyecto/',views.mod_proyecto, name="mod_proyecto"),
    path('empleado/',views.empleado, name="empleado"),
    path('add_empleado/', views.add_empleado, name='add_empleado'),
    path('mod_empleado/',views.mod_empleado, name="mod_empleado"),
    path('reporte_general/',views.reporte_general, name="reporte_general"),
    path('add_ftes/',views.add_ftes, name="add_ftes"),
]
