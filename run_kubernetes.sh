#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="bolah2009/udacity-ml-microservice:v1.0.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice\
    --image=$dockerpath\
    --port=8000 --labels app=ml-microservice

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-microservice 8000:80
