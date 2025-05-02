# Deployment
# Bicep Deployment Scripts

This folder contains modular **Bicep templates** used to deploy individual Azure resources for the MultiSoftware Enterprise cloud infrastructure project.

Each file defines a specific part of the environment and can be deployed independently or integrated into a full deployment.

---

## 📄 Script Descriptions

| File | Purpose |
|------|---------|
| `resource.bicep` | Creates shared foundational resources (e.g., VNet, naming conventions) |
| `app_service.bicep` | Deploys the App Service Plan and a Web App |
| `function.bicep` | Deploys an Azure Function App for serverless backend logic |
| `blob_storage.bicep` | Creates a Storage Account and Blob container (for media or logs) |
| `sql.bicep` | Deploys Azure SQL Server and a database |
| `log.bicep` | Sets up Azure Log Analytics workspace for monitoring |
| `monitoring_app_service.bicep` | Links monitoring (App Insights, Log Analytics) to App Service |
| `monitoring_func.bicep` | Connects monitoring services to the Function App |

---
