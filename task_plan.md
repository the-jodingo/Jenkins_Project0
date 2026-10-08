# Plan for Docker Image + Jenkins + GitHub Push

## Phase 1: Create Dockerfile and project structure
- **Goal**: Write a Dockerfile that builds a Java web app with Maven, produces a .war, and can be pushed to Docker Hub.
- **Actions**:
  1. Create `Dockerfile` in `/Users/prime/Jenkins_Project0/`.
  2. Create `README.md` with usage instructions.
  3. Initialize Git repo, add initial commit.
- **Success criteria**: Dockerfile and README exist; Git repo has at least one commit.

## Phase 2: Push to GitHub
- **Goal**: Push the repository to `github.com/tjodingo/Jenkins_Project0`.
- **Actions**:
  1. Add remote `origin` with write token embedded in URL (or use gh CLI).
  2. `git push -u origin main`.
- **Success criteria**: Repository appears on GitHub with the files.

## Phase 3: Build and Push Docker Image
- **Goal**: Build Docker image and push to Docker Hub.
- **Actions**:
  1. Ensure Docker Hub credentials are available (env vars or `~/.docker/config.json`).
  2. `docker build -t <username>/jenkins-project0 .`
  3. `docker push <username>/jenkins-project0`
- **Success criteria**: Image appears on Docker Hub.

## Phase 4: Deploy to Jenkins (optional)
- **Goal**: (Optional) Deploy the .war to an Apache Tomcat server.
- **Actions**: Use `mvn tomcat7:deploy` if Tomcat is reachable.
- **Success criteria**: (Optional) .war deployed.

---