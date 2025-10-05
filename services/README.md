# services

This directory houses backend services that support the Infinity‑777 Casino platform:

- `monitor/` — watches on-chain events (tickets purchased, winners selected) and exposes Prometheus metrics like `tickets_purchased_total`, `prize_claims_total`, and `vrf_latency_seconds`.
- `indexer/` — optional indexer that syncs contract events into a database for search or analytics.
- `scheduler/` — cron-like workers that invoke draw() or other timed functions.
- `kyc-aml/` — stub API for KYC/AML checks (integrate with providers like SumSub/Persona).
- `monitor/tests/` — load and chaos tests for reliability (k6, chaos engineering).

Each service can be containerized and deployed via Docker Compose or Kubernetes. See the docs for details on configuration.
