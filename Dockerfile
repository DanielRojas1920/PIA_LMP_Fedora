FROM python:3.8-slim-bullseye

RUN pip install gunicorn

WORKDIR /app

COPY docker_app/requirements.txt .

RUN pip install -r /app/requirements.txt

COPY django_app/ /app/

EXPOSE 80/tcp

ENTRYPOINT gunicorn -w 4 -b 0.0.0.0:80 k8s.wsgi