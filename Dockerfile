FROM python:3.12.1

# Güncellemeleri al ve gerekli paketleri yükle
RUN apt-get update && apt-get install -y python3-venv

LABEL Name=core Version=0.0.1

# Uygulama dosyalarını kopyalayın
COPY . /app/

# Çalışma dizinini ayarlayın
WORKDIR /app

# Python venv oluşturma ve bağımlılıkları yükleme
RUN python -m venv --copies /opt/venv \
    && /opt/venv/bin/pip install -r requirements.txt

# PATH değişkenine venv ekleme
ENV PATH="/opt/venv/bin:$PATH"

# Gunicorn ile çalıştırmak için komut
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]
