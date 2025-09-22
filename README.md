
🚀 GitOps Workflow with ArgoCD – Go Web App



A step-by-step guide to building, deploying, and managing a Go web application using GitHub Actions, Docker, Helm, ArgoCD, and AWS EKS.

Step 1: Clone the Repository
git clone https://github.com/yourusername/go-webapp.git
cd go-webapp

Step 2: Run Locally (Optional)

Make sure Go is installed locally to test the app:

go run main.go


Open http://localhost:8080 in your browser.

Step 3: Build Docker Image

Use Docker to containerize the app. The project includes a multi-stage Dockerfile:

docker build -t go-webapp:latest .
docker run -p 8080:8080 go-webapp:latest

Step 4: Configure GitHub Actions for CI

The GitHub Actions workflow does:

Builds & unit tests the Go app.

Runs golangci-lint for static code analysis.

Builds & pushes Docker images to Docker Hub with version tags.

No additional steps are required—just push your code and the workflow triggers automatically.

Step 5: Set Up Kubernetes with Helm

Install Helm:

helm version


Navigate to the Helm chart folder:

cd helm-chart


Deploy the app with Helm locally (for testing):

helm install go-webapp ./ --set image.tag=latest

Step 6: Deploy ArgoCD

Install ArgoCD in a dedicated namespace:

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


Access the ArgoCD UI and log in using the initial password (from the ArgoCD server pod).

Step 7: Configure GitOps

Connect ArgoCD to your GitHub repository.

ArgoCD watches the helm-chart folder and automatically syncs any changes.

On every code push:

GitHub Actions builds & pushes Docker image.

Helm values.yaml is updated with the new image tag.

ArgoCD syncs the updated Helm chart into EKS.

The app is auto-deployed with zero manual intervention.

Step 8: Verify Deployment

Get the Ingress hostname:

kubectl get ingress -n <namespace>


Open in a browser, you should see:

“🚀 Deployed with GitOps Workflow using ArgoCD”

Step 9: Optional Monitoring

Use Prometheus/Grafana for metrics.

Enable logs for debugging via kubectl logs.

Tech Stack

GoLang – Web server

Docker – Containerization

GitHub Actions – CI/CD automation

Helm – Kubernetes packaging

ArgoCD – GitOps deployment

AWS EKS – Kubernetes cluster

NGINX Ingress – Routing traffic

Key Takeaways

Fully automated GitOps workflow ensures reproducibility and visibility.

CI/CD integration with GitHub Actions + Helm + ArgoCD.

Production-grade practices: linting, versioning, continuous delivery.

Extensible for progressive delivery, canary, or blue-green deployments.
