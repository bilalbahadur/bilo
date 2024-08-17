FROM python:3.12.1

# Güncellemeleri al ve python3-venv paketini yükle
RUN apt-get update && apt-get install -y python3-venv

LABEL Name=bilo Version=0.0.1

# Fortune ve cowsay komutlarını çalıştıran bir varsayılan komut ekleyin
CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]

# Uygulama dosyalarını kopyalayın
COPY . /app/

# Çalışma dizinini ayarlayın
WORKDIR /app

# Python venv oluşturma ve bağımlılıkları yükleme
RUN python -m venv --copies /opt/venv \
    && /opt/venv/bin/pip install -r requirements.txt

# PATH değişkenine venv ekleme
ENV PATH="/opt/venv/bin:$PATH"
