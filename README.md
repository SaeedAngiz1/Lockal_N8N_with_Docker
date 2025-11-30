# Local N8N with Docker

A complete Docker setup for running n8n locally with all the essential features enabled. This project allows you to automate workflows, connect to various social media platforms, handle news feeds, manage advertisements, and much more.

## 🚀 Features

- **Full n8n functionality** - Complete workflow automation platform
- **Persistent data storage** - Your workflows and data are saved in Docker volumes
- **Runners enabled** - Enhanced performance with n8n runners
- **File permissions enforced** - Secure file handling
- **Timezone configuration** - Set your local timezone
- **Social media integrations** - Connect to Twitter, Instagram, Facebook, LinkedIn, and more
- **News & RSS feeds** - Automate news aggregation and distribution
- **Advertisement management** - Schedule and manage ads across platforms
- **Easy setup** - Get started in minutes

## 📋 Prerequisites

- **Docker Desktop installed and running** on your system
  - ⚠️ **Important**: Docker Desktop must be running before using docker-compose commands
  - Check if Docker is running: Open Docker Desktop application or run `docker ps` in terminal
- Docker Compose (usually comes with Docker Desktop)
- At least 2GB of free disk space

## 🛠️ Installation

### Option 1: Using Docker Compose (Recommended)

1. **Clone or download this repository**
   ```bash
   git clone <your-repo-url>
   cd "Local N8N with Docker"
   ```

2. **Copy the environment file**
   ```bash
   cp env.example .env
   ```
   Or on Windows:
   ```powershell
   copy env.example .env
   ```

3. **Edit the `.env` file** and set your timezone:
   ```
   GENERIC_TIMEZONE=America/New_York
   ```
   Replace with your timezone (e.g., `Europe/London`, `Asia/Tokyo`, `Australia/Sydney`)

4. **Start n8n**
   ```bash
   docker-compose up -d
   ```

5. **Access n8n**
   Open your browser and go to: `http://localhost:5678`

### Option 2: Using Docker Run Command

If you prefer using the direct Docker command:

```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -e GENERIC_TIMEZONE="America/New_York" \
  -e N8N_ENFORCE_SETTING_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n
```

Replace `America/New_York` with your timezone.

## 📖 Usage

### First Time Setup

1. When you first access n8n at `http://localhost:5678`, you'll be prompted to create an account
2. Create your admin account (this is only needed for the first time)
3. Start creating workflows!

### Common Use Cases

#### Social Media Automation
- **Twitter**: Post tweets, monitor mentions, retweet based on keywords
- **Instagram**: Schedule posts, monitor hashtags, auto-respond to comments
- **Facebook**: Post to pages, manage groups, schedule content
- **LinkedIn**: Share articles, monitor engagement, connect with leads

#### News & Content
- **RSS Feeds**: Aggregate news from multiple sources
- **Content Distribution**: Automatically share news across platforms
- **News Filtering**: Filter and categorize news by keywords

#### Advertisement Management
- **Ad Scheduling**: Schedule ads across different platforms
- **Performance Monitoring**: Track ad performance and metrics
- **Budget Management**: Monitor ad spend and ROI

### Creating Workflows

1. Click "New Workflow" in the n8n interface
2. Add nodes by clicking the "+" button
3. Connect nodes to create automation flows
4. Configure each node with your credentials and settings
5. Activate the workflow when ready

## 🔧 Configuration

### Environment Variables

Edit the `.env` file to customize your setup:

- `GENERIC_TIMEZONE`: Your timezone (required)
- `N8N_ENFORCE_SETTING_FILE_PERMISSIONS`: File permission enforcement (default: true)
- `N8N_RUNNERS_ENABLED`: Enable n8n runners for better performance (default: true)

### Changing Timezone

1. Stop the container: `docker-compose down`
2. Update `GENERIC_TIMEZONE` in your `.env` file
3. Start again: `docker-compose up -d`

## 🛑 Stopping and Starting

### Stop n8n
```bash
docker-compose down
```

### Start n8n
```bash
docker-compose up -d
```

### View logs
```bash
docker-compose logs -f n8n
```

### Stop and remove all data (⚠️ Warning: This deletes your workflows!)
```bash
docker-compose down -v
```

## 📁 Data Persistence

All your workflows, credentials, and data are stored in a Docker volume named `n8n_data`. This means:
- Your data persists even if you stop the container
- You can backup the volume if needed
- Data is stored at: Docker volume `n8n_data`

### Backup Your Data

```bash
docker run --rm -v n8n_data:/data -v $(pwd):/backup alpine tar czf /backup/n8n_backup.tar.gz -C /data .
```

### Restore Your Data

```bash
docker run --rm -v n8n_data:/data -v $(pwd):/backup alpine sh -c "cd /data && tar xzf /backup/n8n_backup.tar.gz"
```

## 🔐 Security Notes

- Change the default admin password after first login
- Use environment variables for sensitive credentials
- Don't commit your `.env` file to version control
- Regularly update the n8n Docker image

## 🐛 Troubleshooting

### Docker Desktop not running (Windows)
**Error**: `The system cannot find the file specified` or `open //./pipe/dockerDesktopLinuxEngine`

**Solution**:
1. Open **Docker Desktop** application on Windows
2. Wait for Docker Desktop to fully start (whale icon in system tray should be steady)
3. Verify Docker is running: Open PowerShell and run `docker ps`
4. If it works, try `docker-compose up -d` again

**Note**: Docker Desktop must be running before executing any docker commands.

### Port 5678 already in use
If port 5678 is already in use, change it in `docker-compose.yml`:
```yaml
ports:
  - "5679:5678"  # Change 5679 to any available port
```

### Container won't start
- Check logs: `docker-compose logs n8n`
- Ensure Docker has enough resources allocated
- Verify your timezone format is correct
- Make sure Docker Desktop is running (see above)

### Can't access n8n
- Ensure the container is running: `docker ps`
- Check if port 5678 is accessible
- Try accessing via `http://127.0.0.1:5678`
- Check container logs: `docker-compose logs n8n`

## 📚 Resources

- [n8n Documentation](https://docs.n8n.io/)
- [n8n Community Forum](https://community.n8n.io/)
- [n8n Integrations](https://n8n.io/integrations/)

## 🤝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## 📝 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- [n8n](https://n8n.io/) - The amazing workflow automation platform
- Docker community for excellent containerization tools

---

**Made with ❤️ for automation enthusiasts**

