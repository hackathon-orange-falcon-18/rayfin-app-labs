# Rayfin App Labs

Workshop repository for **Lab 4 – Rayfin with GitHub Copilot Enterprise + VS Code (Codespaces)**.

You build the Contoso DIY Field Services work-order app (React + TypeScript) on a managed Microsoft Fabric backend, then use GitHub Copilot agent mode to add a feature. Everything runs in your codespace; nothing is installed on your laptop.

## Before Lab 4 (setup section of your guide)

1. Sign in to GitHub with your workshop email.
2. Open this repository, select **Code > Codespaces > Create codespace on main**.
3. In the terminal, run `node --version` (expect v24.x) and ask Copilot Chat "Say hello in one line".

Use **one** codespace for the whole workshop. If it stops, reopen it from <https://github.com/codespaces>.

## Lab 4 at a glance

Full steps are in your workshop guide. The key commands, run from the terminal in this order:

```bash
# Task 2 – bootstrap your app (replace <workspace-uri> with your WS-UserXX URL,
# e.g. https://app.fabric.microsoft.com/groups/<workspace-id>)
npm create -y @microsoft/rayfin@latest -- --project-name field-services-app \
  --template "./template/field-services-app" --workspace-uri <workspace-uri>
git add field-services-app
git commit -m "Bootstrap field-services-app"
cd field-services-app

# Task 4 – provision the Fabric backend and deploy (sign in with your workshop email)
npx rayfin up

# Task 6 – after Copilot has added the comments feature
npx rayfin up db apply
npx rayfin up
git add -A && git commit -m "Add work order comments"
```

Test the app on the **hosted URL** printed by `npx rayfin up` (run `npx rayfin up status` if you lose it). Do not use `npm run dev` for sign-in testing in a codespace: the app only allows Microsoft sign-in to return to `localhost:5173`, which a codespace serves on a different address.

## What is in this repository

| Path | Purpose |
|---|---|
| `template/field-services-app/` | Rayfin app template you bootstrap from. Do not edit it. |
| `.devcontainer/` | Codespace definition: Node.js 24, GitHub CLI, GitHub Copilot extensions, npm cache warm-up |
| `.github/copilot-instructions.md` | Workshop rules for Copilot |
| `.github/skills/rayfin/` | Rayfin skill that teaches Copilot the Rayfin conventions |
| `.vscode/mcp.json` | MCP servers for Copilot: Rayfin and Microsoft Learn docs |
| `lab-files/` | Lab 1 CSV files and Lab 2 Part B policy PDFs |

## Rules for a shared repository

- Do not push to `main`. Your commits stay in your codespace.
- Work only in your own `field-services-app` folder and your own Fabric workspace `WS-UserXX`.
- To keep your app after the workshop, right-click `field-services-app` in the Explorer and select **Download**.

## Credits

The app template, Rayfin skill and MCP configuration come from Microsoft Build 2026 LAB514, [Ship full-stack apps fast with coding agents and a managed backend in Microsoft Fabric](https://github.com/microsoft/Build26-LAB514-ship-ai-apps-fast-with-a-managed-backend-in-microsoft-fabric), used under the MIT License (see `LICENSE`). The Contoso DIY lab files are fictitious training material.
