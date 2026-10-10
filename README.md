# Cloud & DevOps Labs and Projects

A hands-on learning repository covering Linux, networking, AWS, scripting, containers,
Infrastructure as Code, CI/CD, Kubernetes, monitoring, security, and scenario-based projects.

## Learning path

1. Linux and networking fundamentals
2. Bash and Python automation
3. Git and GitHub
4. AWS core services and cloud operations
5. Docker and container registries
6. Infrastructure as Code: Terraform and CloudFormation
7. CI/CD with GitHub Actions and Jenkins
8. Kubernetes
9. Monitoring, logging, security, and reliability
10. End-to-end capstone projects

## Repository layout

- `01-linux/` — commands, users, permissions, services, logs, shell labs
- `02-networking/` — IP/CIDR, DNS, HTTP, ports, routing, troubleshooting
- `03-bash-scripting/` — shell automation and operational scripts
- `04-python-automation/` — Python scripts for cloud and operations tasks
- `05-git-github/` — branching, merge conflicts, tags, workflows
- `06-aws/` — AWS labs grouped by service and difficulty
- `07-docker/` — images, containers, networking, volumes, Compose
- `08-terraform/` — reusable Terraform labs and modules
- `09-cloudformation/` — AWS YAML templates and stack operations
- `10-cicd/` — GitHub Actions and Jenkins pipelines
- `11-kubernetes/` — workloads, services, config, storage, troubleshooting
- `12-ansible/` — inventory, playbooks, roles, configuration management
- `13-monitoring-logging/` — CloudWatch, Prometheus, Grafana, logs, alerts
- `14-security/` — IAM, secrets, vulnerability checks, least privilege
- `15-scenario-projects/` — integrated projects from beginner to advanced
- `16-interview-prep/` — interview questions and troubleshooting scenarios
- `docs/` — architecture diagrams, glossary, learning notes
- `scripts/` — shared helper scripts; avoid storing credentials here

## Project documentation standard

Every substantial project should include:
- `README.md` with scenario, architecture, prerequisites, deployment, validation, cleanup, cost notes
- `architecture/` with diagram source and exported image
- `screenshots/` with evidence that contains no secrets
- `scripts/` or `src/` where relevant
- `troubleshooting.md` with symptoms, root cause, fix, and verification
- `cost-and-cleanup.md` for cloud resources

## Safety rules

- Never commit AWS access keys, private keys, passwords, `.env` files, Terraform state,
  or secret values.
- Use IAM roles or AWS CLI profiles and temporary credentials where possible.
- Review estimated charges before creating resources.
- Delete lab resources after use and verify no billable resources remain.
- Keep public inbound access restricted to required ports and source IPs.
- Use disposable test data and accounts for failure simulations.

## Status

This is a learning roadmap. Mark a project complete only after deploying it, testing it,
documenting what failed, and cleaning up its resources.
