FROM docker/whalesay:latest
LABEL Name=bilo Version=0.0.1

CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
# Base image ve diğer ENV komutlarının olduğu kısımlar

ENV NIXPACKS_PATH=/opt/venv/bin:$NIXPACKS_PATH

# Kopyalama ve Python venv oluşturma komutları
COPY . /app/.
RUN --mount=type=cache,id=s/c2e3ed0d-9d62-43d0-9429-c66fa8679e7e-/root/cache/pip,target=/root/.cache/pip python -m venv --copies /opt/venv && . /opt/venv/bin/activate && pip install -r requirements.txt
