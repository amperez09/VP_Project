from django.db import models
from django.utils import timezone


class Empleado(models.Model):
    idEmpleado = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apPaterno = models.CharField(max_length=50)
    apMaterno = models.CharField(max_length=50,null=True)
    mail = models.EmailField(max_length=50,null=True)
    area = models.CharField(max_length=50,null=True)
    activo= models.IntegerField()
    pais = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre+" "+self.apPaterno+" "+self.apMaterno


class Proyecto(models.Model):
    codigo = models.CharField(max_length=13, primary_key=True)
    tipo = models.CharField(max_length=50)
    nombre = models.CharField(max_length=50)
    nombreFtes = models.ForeignKey('Ftes', on_delete=models.CASCADE)
    activo = models.IntegerField(null=True)


    def __str__(self):
        return self.nombre

class Ftes(models.Model):
    nombreFtes = models.CharField(max_length=50, primary_key=True)
    def __str__(self):
        return self.nombreFtes
    activo= models.IntegerField()

class Periodo(models.Model):
    clavePeriodo = models.CharField(max_length=6, primary_key=True)
    horasTotales = models.IntegerField()
    horasNoLaborables = models.IntegerField(null=True)
    descripcionMes = models.CharField(max_length=20)
    descripcionAnio = models.CharField(max_length=6)
    def __str__(self):
        return self.descripcionMes+" "+self.descripcionAnio

class Bitacora(models.Model):
    class Meta:
        unique_together = (("idEmpleado", "codigo", "clavePeriodo"),)

    idEmpleado = models.ForeignKey('Empleado', on_delete=models.CASCADE)
    codigo = models.ForeignKey('Proyecto', on_delete=models.CASCADE)
    clavePeriodo = models.ForeignKey('Periodo', on_delete=models.CASCADE)
    horasLaborables = models.IntegerField(null=True)
    horasVacaciones = models.IntegerField(null=True)
    horasEnfermedad = models.IntegerField(null=True)
    horasEspeciales = models.IntegerField(null=True)
    horasPorcentaje = models.FloatField(null=True)
