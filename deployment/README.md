# Deployment
# Bicep Deployment Scripts

This folder contains modular **Bicep templates** used to deploy individual Azure resources for the MultiSoftware Enterprise cloud infrastructure project.

Each file defines a specific part of the environment and can be deployed independently or integrated into a full deployment.

---

## 📄 Script Descriptions

| File | Purpose |
|------|---------|
| `resource.bicep` | Creates shared foundational resources  |
| `app_service.bicep` | Deploys the App Service Plan and a Web App |
| `function.bicep` | Deploys an Azure Function App for serverless backend logic |
| `blob_storage.bicep` | Creates a Storage Account and Blob container (for media or logs) |
| `sql.bicep` | Deploys Azure SQL Server and a database |
| `log.bicep` | Sets up Azure Log Analytics workspace for monitoring |
| `monitoring_app_service.bicep` | Links monitoring (App Insights, Log Analytics) to App Service |
| `monitoring_func.bicep` | Connects monitoring services to the Function App |

---
##  Web Portal

The `web_portal/` folder contains a static HTML-based internal portal for **Multisoftware Enterprise**, designed to simulate the company's internal application front-end. It is built with HTML, CSS, and JavaScript, and is intended to be deployed on **Azure App Service**.

### 🔧 Features

- Structured navigation with three sections:
  - **Home** – Welcome message and portal purpose
  - **Privacy** – Overview of security and Entra ID usage
  - **Support** – Placeholder for future support integration
- Simulated **Microsoft Entra ID** sign-in button
- Modern design with animations, mobile responsiveness, and internal branding
- Embedded styles and scripted page transitions
- Image/logo support for corporate identity (e.g. `image.png`)

---

