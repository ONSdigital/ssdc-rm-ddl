FROM python:3.12.10-slim@sha256:bae1a061b657f403aaacb1069a7f67d91f7ef5725ab17ca36abc5f1b2797ff92

RUN pip3 install pipenv
RUN apt-get update -y && apt-get install -y curl git postgresql-client
WORKDIR /app
COPY . /app
RUN pipenv install --system --deploy