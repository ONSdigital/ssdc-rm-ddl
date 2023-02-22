FROM postgres:13-buster

ENV POSTGRES_USER appuser
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB rm

COPY init.sql /docker-entrypoint-initdb.d/