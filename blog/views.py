from django.shortcuts import render
from .forms import EmployeeForm,ProjectForm
# Create your views here.

def post_list(request):
    return render(request, 'blog/post_list.html', {})

#Add employee
def add_empleado(request):
	# if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = EmployeeForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            #return HttpResponseRedirect('/thanks/')
            print(request)
            return render(request, 'blog/add_empleado.html', {'form': form})

    # if a GET (or any other method) we'll create a blank form
    else:
        form = EmployeeForm()

    return render(request, 'blog/add_empleado.html', {'form': form})

#Add project
def add_proyecto(request):
	# if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = ProjectForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            #return HttpResponseRedirect('/thanks/')
            print(request.POST)
            return render(request, 'blog/add_proyecto.html', {'form': form})

    # if a GET (or any other method) we'll create a blank form
    else:
        form = ProjectForm()

    return render(request, 'blog/add_proyecto.html', {'form': form})

def empleado(request):
    return render(request,'blog/empleado.html',{})

def proyecto(request):
    return render(request,'blog/proyecto.html',{})

def mod_proyecto(request):
	# if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = ProjectForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            #return HttpResponseRedirect('/thanks/')
            print(request.POST)
            return render(request, 'blog/mod_proyecto.html', {'form': form})

    # if a GET (or any other method) we'll create a blank form
    else:
        form = ProjectForm()

    return render(request, 'blog/mod_proyecto.html', {'form': form})



def mod_empleado(request):
	# if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = EmployeeForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            #return HttpResponseRedirect('/thanks/')
            print(request)
            return render(request, 'blog/mod_empleado.html', {'form': form})

    # if a GET (or any other method) we'll create a blank form
    else:
        form = EmployeeForm()

    return render(request, 'blog/mod_empleado.html', {'form': form})

def reporte_general(request):
    return render(request,'blog/reporte_general.html',{})