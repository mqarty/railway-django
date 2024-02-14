FROM python:3.11-slim as build

LABEL maintainer="Marty Berryman <mqarty@gmail.com>"

ARG ENV
ARG FUNCTION_DIR="/var/task/"

ENV FUNCTION_DIR=${FUNCTION_DIR}

WORKDIR ${FUNCTION_DIR}

# Install requirements
COPY src/backend/requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY src/backend/manage.py manage.py
COPY src/backend/backend backend

# Create static directory
RUN mkdir -p static
