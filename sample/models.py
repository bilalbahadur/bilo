from django.db import models

class mesajlar(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.TextField(default="No Subject")  # Varsayılan değer burada tanımlanıyor

    def __str__(self):
        return self.name
