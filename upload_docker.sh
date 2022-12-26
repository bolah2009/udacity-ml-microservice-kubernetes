#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="bolah2009/ml_microservice"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Tag locally before pushing to the Dockerhub
docker tag ml_microservice $dockerpath:v1.0.0
docker images

# Log into the Dockerhub from your local terminal
docker login

# Step 3:
# Push image to a docker repository
docker push $dockerpath:v1.0.0
