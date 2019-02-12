from django.shortcuts import render
from .forms import EmployeeForm,ProjectForm,FtesForm
from .models import Empleado,Proyecto,Ftes,Periodo,Bitacora
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
			firstN = request.POST['firstName']
			lastN1 = request.POST['lastName_1']
			lastN2 = request.POST['lastName_2']
			country = request.POST['country']
			email = request.POST['email']
			role = request.POST['role']
			percentage = request.POST['percentage']
			project = request.POST['project']
			active = True

			emp = Empleado(nombre=firstN,apPaterno=lastN1,apMaterno=lastN2,
				pais=country,mail=email,area=role,activo=active)
			emp.save()
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
		#if form.is_valid():
		# process the data in form.cleaned_data as required
		# ...
		codeP = request.POST['codeProject']
		typeP = request.POST['typeProject']
		nameP = request.POST['nameProject']
		ftesName = request.POST['ftes']

		ftesQuery = Ftes.objects.filter(nombreFtes=ftesName).first()
		#ftes = list(Ftes.objects.all().values_list('nombreFtes',flat=True))
		ftes = list(Ftes.objects.all())
		#ftes=Ftes.objects.filter(nombreFtes='QA').first()
		active = True
		print(ftesName)
		# redirect to a new URL:
		#return HttpResponseRedirect('/thanks/')
		form.fields['ftes'].choices = zip(ftes,ftes)

		project = Proyecto(codigo=codeP,tipo=typeP,nombre=nameP,nombreFtes=ftesQuery,activo=active)
		project.save()
		print('POST SAVE')
		print(request.POST)
		return render(request, 'blog/add_proyecto.html', {'form': form})
	# if a GET (or any other method) we'll create a blank form
	else:
		form = ProjectForm()
		ftes = list(Ftes.objects.all())
		form.fields['ftes'].choices = zip(ftes,ftes)
		print('GET')
	return render(request, 'blog/add_proyecto.html', {'form': form })


#Add Ftes
def add_ftes(request):
	# if this is a POST request we need to process the form data
	if request.method == 'POST':
		# create a form instance and populate it with data from the request:
		form = FtesForm(request.POST)
		# check whether it's valid:
		if form.is_valid():
			ftes = request.POST['ftes']
			# process the data in form.cleaned_data as required
			# ...
			ft = Ftes(nombreFtes=ftes,activo=True)
			ft.save()
			# redirect to a new URL:
			#return HttpResponseRedirect('/thanks/')
			print(request.POST)
			return render(request, 'blog/add_ftes.html', {'form': form})

	# if a GET (or any other method) we'll create a blank form
	else:
		form = FtesForm()

	return render(request, 'blog/add_ftes.html', {'form': form})

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