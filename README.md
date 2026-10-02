# AWS Infrastructure as Code — Terraform Portfolio

A sanitized, reusable Terraform project demonstrating production-style AWS infrastructure design: modular VPC + EKS architecture, multi-environment promotion (dev → staging → production), remote state management, secrets handling via AWS Secrets Manager, and CI/CD integration with GitHub Actions.

This repository contains **no real client data, account IDs, or secrets** — it's a portfolio example built to demonstrate architecture and IaC practices, not a deployable client project.

## Architecture overview

```
                    ┌─────────────────────────────┐
                    │           VPC Module          │
                    │  Public + Private Subnets     │
                    │  NAT Gateway, Route Tables     │
                    └───────────────┬─────────────┘
                                    │
                    ┌───────────────┴─────────────┐
                    │           EKS Module          │
                    │  Managed Node Groups          │
                    │  Cluster IAM + OIDC Provider   │
                    └───────────────┬─────────────┘
                                    │
                    ┌───────────────┴─────────────┐
                    │           IAM Module          │
                    │  Least-privilege roles/policies│
                    └─────────────────────────────┘
```

## Repository structure

```
.
├── modules/
│   ├── vpc/      # VPC, subnets, NAT gateway, route tables
│   ├── eks/      # EKS cluster + managed node groups
│   └── iam/      # IAM roles and least-privilege policies
├── environments/
│   ├── dev/
│   ├── staging/
│   └── production/
└── .github/workflows/terraform-ci.yml
```

## Design principles demonstrated

- **Modular design** — VPC, EKS, and IAM are independent, reusable modules consumed by each environment with different variable values, keeping environments structurally consistent while avoiding code duplication.
- **Environment isolation** — Each environment (`dev`, `staging`, `production`) has its own state, variables, and backend configuration, provisioned from the same module source.
- **Remote state with locking** — Each environment uses an S3 backend with DynamoDB-based state locking to prevent concurrent modification conflicts.
- **No hardcoded secrets** — Sensitive values (e.g., database credentials) are referenced via `aws_secretsmanager_secret_version` data sources at apply time, never stored in `.tfvars` or version control.
- **Least-privilege IAM** — IAM roles are scoped per use case (CI/CD execution role, EKS node role, application workload role) rather than using broad, shared permissions.
- **CI/CD integration** — A GitHub Actions workflow runs `terraform fmt`, `validate`, and `plan` on every pull request, with `apply` gated behind manual approval on merge to `main`.

## Usage

```bash
cd environments/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

> Note: `backend.tf` in each environment uses placeholder bucket/table names — update these to your own before running.

## Tech stack

Terraform · AWS (VPC, EKS, IAM, Secrets Manager) · GitHub Actions · S3 + DynamoDB (remote state)

---

Built by [Muhammad Meesam Mehdi](mailto:mmeesammehdi14@gmail.com) — DevOps Engineer
