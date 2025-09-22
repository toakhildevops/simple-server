Go Web Application with DevOps Deployment

Akhil Mohan’s Go web application: A containerized Go web app with CI/CD and Kubernetes deployment ready for production.

Table of Contents

Project Overview

Features

Installation

Usage

DevOps & Deployment

Directory Structure

Contributing

License

Project Overview

This project is a Go web application designed for easy deployment and DevOps automation:

Built using Go for backend.

Handles HTTP requests and serves APIs/pages.

Fully Dockerized for containerized deployment.

Automated CI/CD pipeline using GitHub Actions.

Deployable on Kubernetes, AWS ECS/Fargate, or local Docker environments.

Features

Modular Go web app structure.

RESTful API endpoints (extendable).

Configurable using environment variables.

Logging and metrics ready for monitoring.

Ready for containerized deployment and orchestration.

Installation
Prerequisites

Go 1.21+

Docker

Git

Steps
# Clone the repository
git clone https://github.com/yourusername/project-name.git
cd project-name

# Run locally
go run main.go

# Build Docker image
docker build -t go-webapp:latest .
docker run -p 8080:8080 go-webapp:latest

Usage

Access the app at http://localhost:8080.

Example API endpoints:

GET /api/example → Returns sample data.

POST /api/example → Submit data to the server.

(Add your real endpoints and usage examples here.)

DevOps & Deployment

Dockerized for container deployment.

CI/CD pipeline configured with GitHub Actions: builds, tests, and pushes Docker images automatically.

Kubernetes Deployment YAML provided for scaling:

apiVersion: apps/v1
kind: Deployment
metadata:
  name: go-webapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: go-webapp
  template:
    metadata:
      labels:
        app: go-webapp
    spec:
      containers:
      - name: go-webapp
        image: ghcr.io/yourusername/go-webapp:latest
        ports:
        - containerPort: 8080


Logs and metrics exposed for monitoring via Prometheus/Grafana.

Can be deployed on AWS ECS/Fargate, GKE, or local minikube.

Directory Structure
project-name/
├── main.go           # Entry point
├── Dockerfile        # Docker build instructions
├── go.mod            # Go module dependencies
├── go.sum
├── pkg/              # Packages & modules
├── configs/          # Configuration files
├── k8s/              # Kubernetes YAML manifests
└── README.md         # This file

Contributing

Fork the repository.

Create a new branch: git checkout -b feature/your-feature.

Make your changes and commit: git commit -m "Add feature".

Push to your branch and create a Pull Request.
