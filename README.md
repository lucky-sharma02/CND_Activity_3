
# E-Commerce CI/CD Pipeline using Jenkins, Docker and Terraform

## 1. Project Overview

This project demonstrates the implementation of an automated CI/CD pipeline for an e-commerce web application using Jenkins, Docker, Terraform and AWS EC2.

The pipeline automatically fetches source code from GitHub, builds a Docker image, tests the application and deploys it to an AWS EC2 instance.

## 2. Technologies Used

- AWS EC2 – Cloud infrastructure
- Terraform – Infrastructure as Code
- Jenkins – CI/CD automation
- Docker – Application containerization
- Git and GitHub – Source code management
- Ubuntu – Server operating system
- HTML and CSS – Frontend application

## 3. Architecture

Developer → GitHub → Jenkins → Docker Build → Application Testing → Deployment on AWS EC2

Jenkins uses Poll SCM to periodically check GitHub for new commits and automatically trigger the pipeline.

## 4. Jenkins Pipeline Stages

1. Checkout – Fetches source code from GitHub.
2. Build – Creates the Docker image.
3. Test – Runs the container and verifies the application response.
4. Deploy – Deploys the application on port 80.

## 5. Infrastructure Provisioning

Terraform provisions:
- AWS EC2 instance
- Security group
- SSH access
- Jenkins dashboard access
- HTTP access for the deployed website

## 6. Application Access

- Jenkins Dashboard: http://<EC2-PUBLIC-IP>:8080
- E-Commerce Website: http://<EC2-PUBLIC-IP>

Replace `<EC2-PUBLIC-IP>` with the actual public IP of the deployed instance.

## 7. Project Structure

```text
ecommerce-jenkins-terraform/
├── app/
│   └── index.html
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile
├── .dockerignore
├── .gitignore
├── Jenkinsfile
└── README.md
```

## 8. Execution

1. Provision AWS infrastructure using Terraform.
2. Install and configure Java, Jenkins and Docker.
3. Push application source code to GitHub.
4. Configure a Jenkins Pipeline job using Pipeline script from SCM.
5. Configure Poll SCM to detect source-code changes.
6. Run the pipeline and verify deployment.

## 9. Outcome

Successfully implemented an automated CI/CD pipeline that integrates GitHub, Jenkins, Docker and AWS EC2 to build, test and deploy an e-commerce web application.
