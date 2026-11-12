# Copilot instructions for Rayfin App Labs

This repository is used in a hands-on workshop. Participants bootstrap a Rayfin (Fabric Apps) project from `template/field-services-app` into a folder called `field-services-app`, deploy it to their own Microsoft Fabric workspace, and extend it with GitHub Copilot.

When helping in this repository:

- For anything about Rayfin (data models, decorators, auth, deployment, CLI commands, `rayfin.yml`, `schema.ts`, the Rayfin client), use the `rayfin` skill in `.github/skills/rayfin/` and the Rayfin MCP server configured in `.vscode/mcp.json`.
- Inside `field-services-app/`, follow that project's `AGENTS.md`.
- Make changes in `field-services-app/` only. Do not edit `template/field-services-app/`: it is the clean starting point for every participant.
- Define data with Rayfin entity classes and register them in `rayfin/data/schema.ts`. Do not write SQL migrations, REST endpoints or auth middleware by hand.
- Do not run `npx rayfin up` or `npx rayfin up db apply` unless the participant asks you to; the lab runs those steps manually.
- Never commit secrets. `.env.local` and `rayfin/.deployments.json` are generated per participant and stay out of Git.
- Do not push to `main`. The repository is shared by all participants; commits stay in each person's codespace.
