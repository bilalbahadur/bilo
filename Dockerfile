FROM python:3.12.1

RUN apt-get update && apt-get install -y python3-venv

LABEL Name=bilo Version=0.0.1

WORKDIR /app

COPY . /app/

RUN python -m venv --copies /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install -r requirements.txt

ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 8000

CMD ["gunicorn", "bilo.wsgi:application", "--bind", "0.0.0.0:8000"]
