FROM python:3.12.1

RUN apt-get update && apt-get install -y python3-venv

LABEL Name=bilo Version=0.0.1

CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
# Base image ve diğer ENV komutlarının olduğu kısımlar




# Kopyalama ve Python venv oluşturma komutları
COPY . /app/.
RUN python -m venv --copies /opt/venv && source /opt/venv/bin/activate && pip install -r requirements.txt

ENV NIXPACKS_PATH=/opt/venv/bin:$NIXPACKS_PATH