from django import forms
from django.core.validators import validate_email

#Employee
class EmployeeForm(forms.Form):
	firstName = forms.CharField(label='Nombre', max_length=100, 
		widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Juanito','type': 'text'}))

	lastName_1 = forms.CharField(label='Apellido Paterno', max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Pérez','type': 'text'}))

	lastName_2 = forms.CharField(label='Apellido Materno', max_length=100,required=False,
		widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Camacho','type': 'text'}))
	
	country = forms.ChoiceField(choices=[('MX','MX'),('ES','ES')])
		#widget=forms.TextInput(attrs={'class':'dropdown-menu'}))

	email = forms.EmailField(label='Email',required=False,
		widget=forms.TextInput(attrs={'class':'form-control','placeholder':'juanito@datiobd.com','type':'email'}))

	role = forms.CharField(label='Área', max_length=100,required=False,
		widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Deployment'}))

	percentage = forms.FloatField(label='Porcentaje',widget=forms.TextInput(attrs={'class': 'form-control','placeholder':'0.4'}))

	project = forms.ChoiceField(choices=[('Thor USA','Thor USA'),
		('Guardianes MX','Guardianes MX'),('Soporte MX','Soporte MX')],required=True)
		#widget=forms.TextInput(attrs={'class': 'dropdown'}))

#ProjectForm
class ProjectForm(forms.Form):
	codeProject = forms.CharField(label='Código',max_length=50,
		widget=forms.TextInput(attrs={'class':'form-control', 'placeholder': '3BDH.BBV0100'}))

	nameProject = forms.CharField(label='Nombre del proyecto',max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control', 'placeholder': 'DAT:CDR DevOps MX'}))
	
	typeProject = forms.CharField(label='Tipo',max_length=10,
		widget=forms.TextInput(attrs={'class':'form-control', 'placeholder': 'IN'}))

	ftes = forms.ChoiceField(label='FTES')


#FtesForm
class FtesForm(forms.Form):
	ftes = forms.CharField(label='Ftes',max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control', 'placeholder': 'Deployment'}))

#TimeLapseForm
class TimeLapseForm(forms.Form):
	holiday = forms.ChoiceField(choices=[(0,'0'),(8,'8'),(16,'16'),
		(24,'24'),(32,'32')],required=True)

	timeLapse = forms.ChoiceField(widget=forms.TextInput(attrs={'placeholder':'Periodo'}))


#BitacoraForm
class BitacoraForm(forms.Form):

	idEmployee = forms.IntegerField()

	firstName = forms.CharField(max_length=100, 
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text'}))

	lastName_1 = forms.CharField(max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text'}))

	lastName_2 = forms.CharField(max_length=100,required=False,
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text'}))

	codeProject = forms.CharField(max_length=50,
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text'}))

	nameProject = forms.CharField(max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text','width':'18px'}))
	
	ftes = forms.CharField(max_length=100,
		widget=forms.TextInput(attrs={'class':'form-control','readonly':'readonly','type': 'text'}))
	
	hourWork = forms.CharField(max_length=10,
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	hourVacation =  forms.CharField(max_length=10,
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	hourSick = forms.CharField(max_length=10,
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	hourSpecial = forms.CharField(max_length=10,
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	notes = forms.CharField(max_length=300,
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	percentage = forms.FloatField(
		widget=forms.TextInput(attrs={'class': 'form-control'}))

	holiday = forms.ChoiceField(choices=[(0,'0'),(8,'8'),(16,'16'),
		(24,'24'),(32,'32')],required=True)

	timeLapse = forms.ChoiceField(widget=forms.TextInput(attrs={'placeholder':'Periodo'}))


#Employee-project Form
class EmployeeProjectForm(forms.Form):

	employee = forms.ChoiceField(label='Empleados', required=True)

	project = forms.ChoiceField(label='Proyectos', required=True)
