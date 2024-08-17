from django import forms
from .models import mesajlar

class MesajForm(forms.ModelForm):
    class Meta:
        model = mesajlar
        fields = ['name', 'email', 'subject']
