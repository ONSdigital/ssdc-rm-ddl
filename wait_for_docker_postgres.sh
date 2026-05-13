#!/usr/bin/env bash
# Set the container runtime based on architecture, default to docker for amd64 and podman for arm64
DOCKER=$(if [ "$(uname -m)" = "arm64" ]; then echo podman; else echo docker; fi)

POSTGRES_CONTAINER=dev-postgres-ddl

echo "Waiting for [$POSTGRES_CONTAINER] to be ready"

while true; do
  response=$($DOCKER inspect $POSTGRES_CONTAINER -f "{{ .State.Health.Status }}")
  if [[ "$response" == "healthy" ]]; then
    echo "[$POSTGRES_CONTAINER] is ready"
    break
  fi

  echo "[$POSTGRES_CONTAINER] not ready ([$response] is its current state)"
  ((attempt++))
  if [[ attempt -eq 30 ]]; then
    echo "[$POSTGRES_CONTAINER] failed to start"
    exit 1
  fi
  sleep 2

done

echo "Containers running and alive"
