FROM python:3.7.3-stretch

LABEL version="1.0" \
  description="A dockerfile to containerize \
  a machine learning microservice using kubernetes"

HEALTHCHECK --interval=5m --timeout=3s --start-period=10s \
  CMD curl -f http://localhost/healthcheck || exit 1

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
