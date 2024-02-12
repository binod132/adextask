#!/bin/bash

echo "Logging in to Amazon ECR..."
docker login --username AWS --password $(aws ecr get-login-password --region us-east-1) 232048837608.dkr.ecr.us-east-1.amazonaws.com
echo "Logged in to Amazon ECR successfully."

echo "Pulling image from Amazon ECR"
docker pull 232048837608.dkr.ecr.us-east-1.amazonaws.com/adex-ecr:latest
echo "Pulled image from Amazon ECR successfully."
