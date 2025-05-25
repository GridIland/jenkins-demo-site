# Jenkins Demo Website

A simple HTML/CSS website to demonstrate Jenkins CI/CD automation, i made it to explore freestyle projets mainly.

## Project Structure
```
jenkins-demo-site/
├── index.html          # Main website file
├── README.md           # This file
└── deploy.sh           # Deployment script
```

## Features
- Build information display
- Ready for Jenkins automation

## Setup summary
Quick steps I followed on my Arch Linux VM:

1. Jenkins Setup: Installed Jenkins on VM
2. Apache Setup: Installed Apache (httpd service on Arch, uses `/srv/http directory` for debian it's `/var/www/html/` i believe)
3. GitHub Integration: Created this repository and connected to Jenkins
4. Freestyle Project: Created Jenkins job with Git polling every 5 minutes
5. Deployment Script: Added `deploy.sh` to automatically copy files to Apache
6. Build Variables: Integrated real Jenkins variables into HTML

## How to access 
- Live site: `http://your-vm-ip/jenkins-demo` (deployed on Apache)
- Local testing: Open index.html directly in browser

## Jenkins automation
- Push code to GitHub → Jenkins detects changes → Automatically builds and deploys to Apache
- Site accessible at `http://vm-ip/jenkins-demo`
- Real build info displayed on the website

## Build History
- v1.0: Initial website creation
- Each Jenkins build will add a new entry here
