# Facilitator setup for Rayfin App Labs

Complete this at least two days before the workshop, then dry-run it with a **member** account (not an owner).

## 1. Push this repository

1. Create the repository `rayfin-app-labs` in the workshop organisation (private or internal).
2. Push the contents of this folder to `main`.
3. Under **Settings > Collaborators and teams**, give the participants' team (or the organisation base permission) **Read** access. Read is enough to create a codespace and commit inside it, and it stops anyone pushing to `main`.

## 2. GitHub accounts and Copilot

- All 40 workshop accounts are **members** of the organisation. Pending invitations mean no access: accept them beforehand.
- Sign in to each account once before the day, or confirm the workshop mailboxes receive GitHub device verification codes.
- If the accounts are Enterprise Managed Users, participants sign in through Microsoft Entra instead of a GitHub password. Adjust the guide's setup wording.
- Copilot Business/Enterprise seats assigned to all 40 accounts, with a US$100 per-user premium-request budget.
- Copilot policies: agent mode, MCP servers and the models you want participants to use are enabled.

## 3. Organisation Codespaces settings

In the organisation's **Settings > Codespaces**:

- **General:** enable Codespaces for all members (or the workshop team). Usage is billed to the organisation.
- **Policies:** restrict machine types to 4-core, set the maximum idle timeout (30–60 minutes) and a short retention period (for example 3 days).

In the organisation's billing settings, set a **Codespaces budget**. As a rough guide, a 4-core codespace costs about US$0.36 per hour, so 40 people for 4 hours is about US$60 plus storage and prebuild costs. Check current pricing.

## 4. Prebuild

In the repository's **Settings > Codespaces > Set up prebuild**:

- Branch: `main`
- Trigger: every push (or on configuration change)
- Region: **Southeast Asia**

The prebuild runs `.devcontainer/warm-cache.sh`, which downloads the template's npm packages ahead of time. Wait until the prebuild shows as ready before the workshop; codespaces then open in seconds.

## 5. Lab files for the other labs

- `lab-files/service_pros.csv` and `lab-files/work_orders.csv`: Lab 1. Participants can download them from the repository page.
- `lab-files/policies/*.pdf`: upload to lakehouse `lh_policies` in `WS-Shared`, folder `Files/policies`, then create the Foundry knowledge base `kb-contoso-policies` (Lab 2 Part B).

## 6. Dry run (member account)

- [ ] Sign in with a workshop account and open the repository from the organisation page.
- [ ] Create a codespace. It says it is using a prebuild, `node --version` prints v24.x, and Copilot Chat replies.
- [ ] Run the Lab 4 bootstrap command against a test workspace.
- [ ] Run `npx rayfin up` and **note exactly how Microsoft Entra sign-in behaves inside the codespace** (browser tab or link and device code). Update the guide's Task 4 wording to match.
- [ ] Sign in on the hosted URL, run the Copilot comments prompt, then `npx rayfin up db apply` and `npx rayfin up`.
- [ ] Check Codespaces usage in the organisation's billing page.

## 7. On the day and afterwards

- Organisation owners can see each participant's codespace under the organisation's Codespaces settings, which helps when someone is stuck.
- After the workshop: delete participants' codespaces, remove Copilot seats, and remove or reset the workshop accounts.
