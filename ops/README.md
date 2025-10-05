# ops

This directory contains operational resources for local development and infrastructure management:

- `docker-compose.yml` — launches the full stack (web, indexer, scheduler, monitor, kyc-aml, database) locally using Docker.
- `helm/` — Helm charts and values for Prometheus Operator or other components.
- `k6/` — load testing scripts using k6.
- `chaos/` — chaos engineering manifests (e.g., PodKill) for resilience drills.
- `safe/` — tools for managing Gnosis Safe roles and transactions (e.g., roles templates, CLI generator).
- `scripts/` — helper scripts for Kubernetes, backups, etc.

See the docs and runbooks for how to use these resources.
