from django.shortcuts import render
from .forms import EmployeeForm,ProjectForm,FtesForm,BitacoraForm
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

#Remove employee
def rm_empleado(request):
	#if request.method == 'POST':
	return render(request, 'blog/rm_empleado.html')





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
	if request.method == 'GET':
	
		empl=list(Empleado.objects.all().values_list('idEmpleado','nombre', 
			'apPaterno','apMaterno','pais','mail','area','activo').order_by('nombre'))
	
		return render(request,'blog/empleado.html',{'empl': empl})

def proyecto(request):
	if request.method == 'GET':
		project = list(Proyecto.objects.all().values_list('codigo','tipo','nombre',
			'activo','nombreFtes_id').order_by('nombre'))
		print(project)
		return render(request,'blog/proyecto.html',{'project': project})

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
	if request.method == 'GET':
		form = BitacoraForm()
		print('reporte GET')
		return render(request,'blog/reporte_general.html',{'form':form})


	elif request.method == 'POST':
		timeLapse = request.POST['timeLapse']
		print(request.POST)
		print('reporte POST')
		bitacora = Bitacora.objects.select_related('idEmpleado', 'codigo', 'clavePeriodo').filter(clavePeriodo=timeLapse)
		form = BitacoraForm()

		return render(request,'blog/reporte_general.html',{'bitacora': bitacora, 'form':form, 'timeLapse':timeLapse})


def guardar_reporte(request):
	if request.method == 'POST':
		form = BitacoraForm(request.POST)
		print('POST guardar reporte')
		# check whether it's valid:
		if form.is_valid():

			idEmployee = request.POST['idEmployee']
			firstName = request.POST['firstName']
			lastName_1 = request.POST['lastName_1']
			lastName_2 = request.POST['lastName_2']
			codeProject = request.POST['codeProject']
			nameProject = request.POST['nameProject']
			ftes = request.POST['ftes']
			hourWork = request.POST['hourWork']
			hourVacation = request.POST['hourVacation']
			hourSick = request.POST['hourSick']
			hourSpecial = request.POST['hourSpecial']
			notes = request.POST['notes']
			percentage = request.POST['percentage']
			holiday = request.POST['holiday']
			timeLapse = request.POST['timeLapse']

			# process the data in form.cleaned_data as required
			# ...
			bitacora = Bitacora(idEmpleado=idEmployee,codigo=codeProject,clavePeriodo=timeLapse,
				horasLaborables=hourWork,horasVacaciones=hourVacation,horasEnfermedad=hourSick,
				horasEspeciales=hourSpecial,horasPorcentaje=percentage,observaciones=notes)
			bitacora.save()
			# redirect to a new URL:
			#return HttpResponseRedirect('/thanks/')
			print('reporte guardado')
			print(request.POST)
			return render(request, 'blog/reporte_general.html')
