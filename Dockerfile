FROM python:3.12.1

RUN apt-get update && apt-get install -y python3-venv

LABEL Name=bilo Version=0.0.1

CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
# Base image ve diğer ENV komutlarının olduğu kısımlar




# Kopyalama ve Python venv oluşturma komutları
COPY . /app/.
# Python venv oluşturma ve bağımlılıkları yükleme
RUN python -m venv --copies /opt/venv \
    && /opt/venv/bin/pip install -r requirements.txt

# Eğer NIXPACKS_PATH kullanıyorsanız, onu burada tanımlayın
ENV NIXPACKS_PATH=/opt/venv/bin

# PATH değişkenine venv ekleme
ENV PATH="/opt/venv/bin:$PATH"
