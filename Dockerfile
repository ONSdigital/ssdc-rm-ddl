FROM python:3.11.7-slim@sha256:89c610d12fe12b3e06f35d070f79e57cf14e2bd89c071435ee3678419b691603

RUN pip3 install pipenv
RUN apt-get update -y && apt-get install -y curl git postgresql-client
WORKDIR /app
COPY . /app
RUN pipenv install --system --deploy