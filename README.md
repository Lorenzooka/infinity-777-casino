# FajroX Raffle — MetaWin-style (English index & quickstart)

This is a complete, production-ready monorepo for a MetaWin-style NFT raffle platform:
- Chainlink VRF for provably fair randomness
- USDC/ETH ticket purchases (Permit2 one-click)
- Gnosis Safe admin guard, Zodiac Roles, Delay modules
- Full observability with Prometheus, Grafana, Alertmanager and Operator
- Argo Rollouts canary deployments with Prometheus-based go/no-go
- VRF latency metrics instrumentation
- Security CI: Slither, Semgrep, Trivy, Dependabot
- Safe Roles generator (ARCANE SHIELD)

If you want a step-by-step walkthrough, say **AGENT MODE** and we can set up the project together.

## What this repo contains

- **contracts/** – Solidity smart contracts (RaffleManager, PrizeVault, PrizeNFT) plus Hardhat deployment scripts.
- **web/** – Next.js App Router user UI, admin UI, Gnosis Safe helpers, Roles generator.
- **services/** – Node microservices:
  - monitor: on-chain events watcher & VRF latency tracking
  - indexer: database sync (optional)
  - scheduler: time-based tasks (optional)
  - kyc-aml: KYC/AML stub API (replace with real provider)
- **k8s/** – Kubernetes manifests for base deployment, observability (Prometheus/Grafana or Operator), Argo Rollouts, and backup CronJobs.
- **ops/** – Docker Compose stack, Helm values, k6 load tests, chaos tests, Safe tools.
- **docs/** – Deploy playbook, runbook, metrics guides, security/key management docs.
- **.github/** – GitHub Actions workflows for CI/CD, security scanning.
- **ops/safe/** – Zodiac Roles templates and ABI-based roles generator (CLI & UI).

## Top features

- Multi-prize raffles (ETH, ERC20, ERC721, or mint-on-claim NFTs).
- USD-indexed ticket pricing via Chainlink price feeds; pay in stablecoins.
- Chainlink VRF v2.x integration for secure randomness; supports manual draws.
- Permit2 support for one-click ERC20 purchases.
- Gnosis Safe integration (multisig admin, Roles, Delay).
- Roles generator: generate Zodiac Roles JSON from contract ABI (CLI and admin UI).
- Observability stack: Prometheus, Grafana, Alertmanager (vanilla or Operator).
- Argo Rollouts canary with Prometheus AnalysisTemplate gating (error rate, latency).
- VRF latency metrics via `vrf_latency_seconds` histogram.
- Security CI: Slither, Semgrep, Trivy and Dependabot.
- Runbooks, chaos tests, backups, and incident response materials.

## Quickstart (local)

Prerequisites: Node.js 20+, Docker, Git.

1. Clone this repository and initialize a local git repo:
   ```bash
   git init
   git add .
   git commit -m "initial"
   git branch -M main
   git remote add origin <YOUR_GITHUB_REPO_URL>
   git push -u origin main
   ```

2. Copy `.env.example` files in `contracts/` and `web/` to `.env` / `.env.local`, and fill the required fields (VRF subscription, RPC endpoints, Safe addresses).

3. Spin up the local stack via Docker Compose:
   ```bash
   cd ops
   docker compose -f docker-compose.yml up --build
   ```
   - Web UI: http://localhost:3000
   - KYC stub: http://localhost:8081
   - Database: accessible at localhost:5432

4. Deploy contracts (Polygon Amoy testnet):
   ```bash
   cd contracts
   npm ci
   cp .env.example .env
   # fill VRF, safe, permit2 details
   npx hardhat compile
   npx hardhat run scripts/deploy.ts --network polygon_amoy
   ```
   Record the deployed addresses (RaffleManager, PrizeVault, PrizeNFT) and update your `.env.local` accordingly.

5. Set up the VRF subscription: create/fund on Chainlink VRF dashboard and add the RaffleManager as consumer. Optionally set the native/USD price feed.

6. Run the web app:
   ```bash
   cd web
   npm ci
   cp .env.example .env.local
   # set NEXT_PUBLIC_RAFFLE_MANAGER, NEXT_PUBLIC_RPC_URL, etc.
   npm run dev
   ```
   - Admin: `/admin` for raffle creation and management.
   - Roles generator: `/admin/safe/roles` for generating Zodiac Roles JSON.

7. To freeze or draw manually: use the Safe helpers in `/admin/safe`. Use the Roles generator to import Roles into Gnosis Safe.

For production deployment, refer to `docs/deploy-playbook.md` for a detailed guide covering CI/CD, Kubernetes, observability, canary rollouts, backups and incident management.

## License

MIT. See `LICENSE`.
