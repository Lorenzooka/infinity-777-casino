# web

This directory contains the Next.js 14 (App Router) front‑end for the Infinity‑777 Casino platform. Key features include:

- **User pages** — a landing page and raffle detail pages where players connect their wallet, buy tickets (ETH, ERC20, or USD‑pegged), and claim prizes once a draw is complete. The pages use `wagmi` / `viem` for EVM interaction and support Permit2 for one‑click ERC20 purchases.
- **Admin portal** — under `/admin` there are pages to create raffles, configure prizes (ETH, ERC20, ERC721, MINT_NFT), trigger a manual draw (`DRAW NOW`), view open/closed raffles, export CSV reports, and view on‑chain statistics (entrants, winners, tickets per hour).
- **Safe helper** — the `/admin/safe` route provides calldata generators and direct links to your Gnosis Safe queue for actions like pausing the raffle, drawing winners, or updating VRF parameters.
- **Roles generator** — `/admin/safe/roles` contains an ABI‑to‑Zodiac roles generator. Paste your contract ABI and addresses to produce Guardian/Ops/Owner role JSON for the Safe Roles module. A CLI equivalent lives in `ops/safe/generate-roles-from-abi.mjs`.
- **Stats dashboards** — the `/admin/stats` page includes bar charts and time‑series charts for entrants and ticket purchases. It can be extended with additional analytics from the monitor service.

### Development

Install dependencies and run the dev server:

```
cd web
npm install
cp .env.example .env.local  # update chainId, RPC_URL, contract addresses
npm run dev
```

The Next.js app can be deployed to Vercel or any Node‑friendly hosting service. Production builds use `npm run build && npm run start`.

### Notes

The app uses **Tailwind CSS** for styling, `chart.js` for charts, and is integrated with **Gnosis Safe** for admin actions. Environment variables (contract addresses, RPC URLs, chain ID, permit2 address, etc.) are loaded from `.env.local`. See the root README or docs for more details on features and configuration.
