FROM python:3.8-slim-buster as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py . -- copy from builder

CMD [ "python", "app.py" ]
