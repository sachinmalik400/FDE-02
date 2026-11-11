# BTP Development – Claude Guardrails

## Project context
- SAP BTP Cloud Foundry, region US10 (us10.hana.ondemand.com)
- API endpoint: https://api.cf.us10.hana.ondemand.com
- Org: org_pocus  |  Space: POC
- Stack: CAP (Node.js), MTA deployment via `mbt` + `cf8 deploy`

## Guardrails

- Only work in org **org_pocus**, space **POC**. Never run `cf8 target` to any other org or space.
- Never run `cf8 delete`, `cf8 delete-service`, or `cf8 undeploy` without asking first.
- Always show the full `cf8 deploy` command and wait for approval before running it.
- Never ask for, print, or store passwords or service keys in any file.
- Use **SQLite** for local development and testing; use **HANA Cloud** when deploying to BTP.

## Tool versions (confirmed 2026-11-11)
| Tool | Version |
|------|---------|
| Node.js | 26.13.0 |
| npm | 11.20.0 |
| @sap/cds-dk | 10.2.1 |
| cf8 | 8.19.0 |
| mbt | 1.2.51 |
| multiapps plugin | 3.12.0 |

## Deployment checklist (run in order)
1. `mbt build -t gen/mta-archives`
2. Review the `.mtar` contents
3. `cf8 target -o org_pocus -s POC`
4. `cf8 deploy gen/mta-archives/<app>.mtar` ← requires explicit user approval
