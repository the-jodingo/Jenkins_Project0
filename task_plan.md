# DevOps Resume Project — ATS-Optimized, Skill-Driven

## Phase 1: Job Intelligence (scrape & analyse 50 DevOps roles)
- Task: search/scrape 50 DevOps job postings (Indeed, LinkedIn, Glassdoor, We Work Remotely, RemoteOK, etc.)
- Extract: title, required skills (AWS, Kubernetes, Terraform, Docker, Jenkins, CI/CD, Linux, Python, Monitoring, Security), years of experience, location type
- Aggregate top 15 skills by frequency (skills matrix CSV/JSON in workspace)

## Phase 2: Skill Mapping to GitHub Reference
- Map top skills to existing GitHub repo (Jenkins_Project0: Docker, Maven, Jenkins, Tomcat, Kubernetes concepts via Docker Compose)
- Note gaps and fill with generic but realistic 2-3 year DevOps experience descriptions

## Phase 3: Resume Generation (5 ATS-proof resumes)
- Generate 5 resume variants targeting the 50-role aggregate skill profile
- Each resume: clean ATS format (.md and .txt), 2-3 years experience, no agent/delegation markers
- Sections: Contact, Professional Summary (targeting aggregated skills), Technical Skills (mapped from Phase 1), Professional Experience (2-3 roles with metrics: reduced build time X%, deployed Y containers, managed Z pipelines), Education, Certifications (if realistic)
- All resumes must reference skills from Phase 1 matrix (highest frequency first)

## Phase 4: ATS Validation & Clean Push
- Scan all resume files for agent/subagent markers (reuse agent-free hook rules from repo)
- Push resumes to github.com/the-jodingo (new branch `devops-resumes` or same repo under `/resumes/`)
- Commit messages: clean human-style only (`- the-jodingo` identity)

## Rules (applies to every delegate and file)
- NO agent/subagent/delegation references in resume text, filenames, or commit messages
- All code/files must be pure and raw (human-written appearance)
- Author identity: `- the-jodingo` only
- Resume quality: ATS-optimized (no tables, no graphics, keyword-dense, metric-driven, 2-3 years realistic)
