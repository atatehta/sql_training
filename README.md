# SQL Training: Connect and Run Queries

This repository is a simple starter for running SQL queries against a shared Supabase database.

You can use either setup path below. Both are fully supported.

## What is included

- SQLTools + PostgreSQL/Cockroach driver setup for Codespaces
- A preconfigured SQLTools connection named `Shared Supabase (Pooler)`
- A sample query in `queries/01_verify_connection.sql`

## Option A: GitHub Codespaces (no install required)

1. Open this repository on GitHub.
2. Click **Code** -> **Codespaces** -> **Create codespace on main**.
3. Open SQLTools in the left sidebar.
4. Select the connection **Shared Supabase (Pooler)**.
5. Click connect and enter the shared class password when prompted.
6. Open `queries/01_verify_connection.sql` and run it.
7. If you see database/user/time results, your connection is working.

## Option B: Local VS Code

1. Clone this repository.
2. Open it in VS Code.
3. Install these extensions:
   - `SQLTools` (`mtxr.sqltools`)
   - `SQLTools PostgreSQL/Cockroach Driver` (`mtxr.sqltools-driver-pg`)
4. Open SQLTools.
5. Use the connection **Shared Supabase (Pooler)** from workspace settings.
6. Click connect and enter the shared class password when prompted.
7. Open `queries/01_verify_connection.sql` and run it.
8. If you see database/user/time results, your connection is working.

## Connection details (already prefilled)

- Driver: `CockroachDB`
- Host: `aws-1-us-east-1.pooler.supabase.com`
- Port: `6543`
- Database: `postgres`
- Username: `hpa_tech_train.eiiphhhdravstbmgxvjc`
- SSL: `true`
- Password: entered at connect time

## Why use the pooler?

- It is more reliable across different student networks than direct port `5432`.
- It is designed for many concurrent connections.

## Notes

- Students only need the shared password.
- In a new Codespace, students may need to enter the password again.
