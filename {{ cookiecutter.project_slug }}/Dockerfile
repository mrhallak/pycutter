# Use an official Python runtime as a base image
FROM python:{{ cookiecutter.python_version }}-slim

RUN mkdir /app

# Set the working directory in the container
WORKDIR /app

# Copy the poetry configuration files
COPY pyproject.toml poetry.lock /app/

# Install poetry
RUN pip install poetry

# Install project dependencies
RUN poetry install --no-root --no-directory

# Copy the rest of the application code
COPY . /app/

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/app

# Define the command to run on container start
ENTRYPOINT []
CMD []
