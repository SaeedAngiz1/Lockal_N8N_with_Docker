# Quick Start Guide

Get n8n running in 3 simple steps!

**⚠️ Important**: Make sure Docker Desktop is running before starting!

## Step 1: Setup Environment

Copy the example environment file:
```bash
# Linux/Mac
cp env.example .env

# Windows PowerShell
copy env.example .env
```

Edit `.env` and set your timezone:
```
GENERIC_TIMEZONE=Europe/Berlin
```
Replace with your timezone (e.g., `America/New_York`, `Asia/Tokyo`, `Australia/Sydney`)

## Step 2: Start n8n

**Make sure Docker Desktop is running first!**

```bash
docker-compose up -d
```

**Troubleshooting**: If you get an error about "dockerDesktopLinuxEngine" or "The system cannot find the file specified", it means Docker Desktop is not running. Open Docker Desktop and wait for it to fully start, then try again.

## Step 3: Access n8n

Open your browser: **http://localhost:5678**

Create your admin account and start automating! 🚀

---

### Alternative: Using Docker Run

If you prefer the direct docker command:

**Linux/Mac:**
```bash
chmod +x docker-run.sh
./docker-run.sh
```

**Windows:**
```bash
docker-run.bat
```

Or manually:
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -e GENERIC_TIMEZONE="Europe/Berlin" \
  -e N8N_ENFORCE_SETTING_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n
```
Replace `Europe/Berlin` with your timezone.

---

### Stop n8n

```bash
docker-compose down
```

### View Logs

```bash
docker-compose logs -f n8n
```

