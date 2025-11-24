# Visual Visitors in ICU

This repository contains a PHP + Node.js sample for running virtual ICU visits. It includes a web frontend (PHP), a signaling/webrtc server (Node.js) and simple APIs under `hosp/`.

Quick overview
- PHP app: `hosp/` (web files, dashboard, API endpoints)
- Signaling server: `hosp/server/` (Node.js signaling/websocket server)

Requirements
- PHP 7.4+ with typical extensions (MySQLi / PDO if using a database)
- MySQL / MariaDB (if you want to use the provided SQL)
- Node.js 14+ for the signaling server

Quick start (development)
1. Copy example configuration or create environment variables for secrets (do NOT commit credentials).
   - If you have a config file such as `hosp/config/database.php`, replace hardcoded credentials with environment lookups or remove them before pushing publicly.
2. Start the PHP app (for local testing you can use the built-in PHP server):

```bash
cd hosp
php -S localhost:8000
```

3. Start the signaling server:

```bash
cd hosp/server
npm install
node signaling-server.js
```

Security notes
- I scanned the current working tree and did not find plaintext API keys or passwords in tracked files. However, please double-check `hosp/config` and `hosp/scripts` for any credentials before making the repo public.
- If you have credentials in `hosp/config/database.php`, update the file to use environment variables (getenv()) and add any local `.env` or credentials files to `.gitignore`.

Recommended next steps
- Add a `.env.example` with placeholders for DB_HOST, DB_USER, DB_PASS, etc.
- Add a LICENSE if you plan to open-source the project.
- Add documentation for how to run the full stack and any sample data import commands.

If you want, I can automatically create a `hosp/.env.example` and update `hosp/config/database.php` to load from environment variables (leaving current behavior as fallback) — tell me if you want me to make that change.

---
Small updates made in this session: repository initialized, `.gitignore` added, node_modules removed from the index, and the project was pushed to GitHub at `https://github.com/Suraj752020/visual-visitors-in-icu`.
