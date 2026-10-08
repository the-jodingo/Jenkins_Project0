# Plan for Docker Image + Jenkins + GitHub Push

Status: Phase 1 & 2 (local) complete. Phase 3 pending auth.

## Phase 1: Create Dockerfile and project structure [COMPLETE]
- Dockerfile, README.md, task_plan.md, pom.xml created.
- Subagent `deleg_505335fc` (free model: inkling) added 4 extra commits:
  - `0b7f9e2` Add sample index.jsp
  - `ddf5e2b` Add HelloServlet
  - `44760ea` Add Jenkinsfile
  - `8aef174` Add docker-compose.yml

## Phase 2: Push to GitHub [READY — needs auth]
- Remote `origin` set to `https://github.com/the-jodingo/Jenkins_Project0.git`
- Git log: 6 commits total (Initial + Dockerfile/README/task_plan + 4 subagent files)
- **Remaining**: user must provide GitHub PAT or run `gh auth login` then `git push -u origin master`.

## Phase 3: Build and Push Docker Image [PENDING]
- Dockerfile validated (multi-stage maven → tomcat).
- `docker-compose.yml` added by subagent for easy `docker-compose up`.
- **Remaining**: `docker login` + `docker push` once Docker Hub auth is configured.

## Phase 4: Deploy to Jenkins / Tomcat [PENDING — optional]
- Can be triggered by Jenkins pipeline referencing the `.war` in `target/`.

---
Next step: Provide GitHub token / Docker Hub login, then run the push commands.
