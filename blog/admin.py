from django.contrib import admin

from .models import Empleado
from .models import Ftes
from .models import Periodo
from .models import Proyecto
from .models import Bitacora
# Register your models here.

#admin.site.register(Empleado)
# Define the admin class
@admin.register(Empleado)
class EmpleadoAdmin(admin.ModelAdmin):
    list_display = ('nombre_empleado', 'apellido_paterno', 'apellido_materno', 'mail','area')
    def nombre_empleado(self, obj):
        return ("%s" % (obj.nombre))
        nombre_empleado.short_description = 'Nombre Empleado'

    def apellido_paterno(self, obj):
        return ("%s" % (obj.apPaterno))
        apellido_paterno.short_description = 'Apellido Paternal'

    def apellido_materno(self, obj):
        return ("%s" % (obj.apMaterno))
        apellido_materno.short_description = 'Apellido Maternal'

    list_filter = ('nombre', 'area')

# Register the admin class with the associated model
#admin.site.register(Empleado,EmpleadoAdmin)
#@admin.register(Ftes)
#class FtesAdmin(admin.ModelAdmin):
#    list_display = ('nombreFtes')

admin.site.register(Ftes)

@admin.register(Periodo)
class PeriodoAdmin(admin.ModelAdmin):
    list_display = ('clavePeriodo','horasTotales','horasNoLaborables','descripcionMes','descripcionAnio')

#admin.site.register(Periodo)

@admin.register(Proyecto)
class ProyectoAdmin(admin.ModelAdmin):
    list_display = ('codigo','tipo','nombre','nombreFtes')

#admin.site.register(Proyecto)


@admin.register(Bitacora)
class BitacoraAdmin(admin.ModelAdmin):
    list_display = ('codigo','clavePeriodo','horasLaborables','horasVacaciones','horasEnfermedad','horasEspeciales','horasPorcentaje')

#admin.site.register(Bitacora)

