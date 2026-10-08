# Jenkins Project0 — Maven Web Application

## Overview
This repository contains a simple Maven web application that produces a `.war` artifact and can be containerized with Docker for deployment to Apache Tomcat (e.g., via Jenkins).

## Project Structure
```
Jenkins_Project0/
├── pom.xml                # Maven POM — war packaging, tomcat-maven-plugin
├── Dockerfile             # Multi‑stage build: maven → tomcat
├── src/
│   └── main/
│       └── webapp/
│           ├── index.jsp  # Sample page (created on first build)
│           └── WEB-INF/
│               └── web.xml
├── task_plan.md           # This plan
└── README.md              # You are here
```

## Building Locally (without Docker)
```bash
mvn clean package          # produces target/ROOT.war
```

## Docker Build & Push
```bash
# 1. Build the image (replace `your-dockerhub-username` with your actual account)
docker build -t your-dockerhub-username/jenkins-project0 .

# 2. Push to Docker Hub
docker push your-dockerhub-username/jenkins-project0
```

## Running the Container Locally
```bash
docker run -d -p 8080:8080 your-dockerhub-username/jenkins-project0
```
Visit `http://localhost:8080` — the app will display a hello page served by Tomcat.

## Jenkins Integration
- In a Jenkins pipeline, you can use the **Docker Pipeline** plugin:
```groovy
docker.image('your-dockerhub-username/jenkins-project0').inside {
    // run mvn tests, etc.
}
```
- Or use the **Tomcat Manager** plugin to deploy the `.war` after the image is run.

## Credentials
- Docker Hub: ensure you are logged in (`docker login`) or store credentials in `~/.docker/config.json`.
- GitHub: a personal access token with `repo` scope is needed to push this repo (see `git remote add` below).

## GitHub Push
```bash
# From the project root
git remote add origin https://github.com/tjodingo/Jenkins_Project0.git
git branch -M main
git push -u origin main
```
*(You will be prompted for your GitHub token or use `gh auth login` first.)*