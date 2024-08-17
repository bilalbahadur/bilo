# Python 3.12.1 base image kullanın
FROM python:3.12.1

# Güncellemeleri al ve gerekli paketleri yükle
RUN apt-get update && apt-get install -y python3-venv

# Uygulama bilgilerini belirtin
LABEL Name=bilo Version=0.0.1

# Çalışma dizinini ayarlayın
WORKDIR /app

# Uygulama dosyalarını kopyalayın
COPY . /app/

# Python venv oluşturma ve bağımlılıkları yükleme
RUN python -m venv --copies /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install -r requirements.txt

# PATH değişkenine venv ekleme
ENV PATH="/opt/venv/bin:$PATH"

# Uygulamanın çalıştırılacağı portu belirtin
EXPOSE 8000

# Uygulama başlangıç komutunu belirtin
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
