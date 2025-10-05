# k8s

This directory contains Kubernetes manifests for deploying the Infinity‑777 Casino platform on Kubernetes. It includes:

- `base/` — core deployment YAMLs (Deployment, Service, Ingress).
- `observability/` — vanilla Prometheus/Grafana/Alertmanager stack.
- `observability-operator/` — Prometheus Operator (kube-prometheus-stack) config with ServiceMonitor, PrometheusRule, AlertmanagerConfig, dashboards.
- `argo/` — Argo Rollouts canary deployment manifests and analysis templates.
- `cron/` — CronJobs such as daily backups.

Refer to the docs in `docs/` for installation instructions.
