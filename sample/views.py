from django.shortcuts import render
from .models import mesajlar
from django.http import HttpResponse
from .forms import MesajForm

# Create your views here.

def index(request):
    success = False
    if request.method == "POST":
        form = MesajForm(request.POST)
        if form.is_valid():
            form.save()
            success = True
    else:
        form = MesajForm()
    return render(request, 'index.html', {'form': form, 'success': success})




def fiyatlandirma(request):
    return render(request, 'fiyatlandirma.html')
