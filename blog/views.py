from django.shortcuts import render

# Create your views here.

def post_list(request):
    return render(request, 'blog/post_list.html', {})
def add_empleado(request):
    return render(request, 'blog/add_empleado.html', {})
def empleado(request):
    return render(request,'blog/empleado.html',{})
def proyecto(request):
    return render(request,'blog/proyecto.html',{})
def add_proyecto(request):
    return render(request,'blog/add_proyecto.html',{})
def mod_proyecto(request):
    return render(request,'blog/mod_proyecto.html',{})
def mod_empleado(request):
    return render(request,'blog/mod_empleado.html',{})
def reporte_general(request):
    return render(request,'blog/reporte_general.html',{})