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
- Responsive design
- Build information display
- Clean, modern styling
- Ready for Jenkins automation

## How to Run Locally
1. Open `index.html` in your browser
2. Or serve with a simple HTTP server:
   ```bash
   python3 -m http.server 8000
   ```

## Jenkins Integration
This project is configured to be automatically built and deployed by Jenkins when changes are pushed to the repository.

## Build History
- v1.0: Initial website creation
- Each Jenkins build will add a new entry here
