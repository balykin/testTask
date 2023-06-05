### Helm chart to deploy weather-app
**Requirements!**
Helm should be installed on your local PC.
---
### How to
To deploy weather-app in k8s simply run command:
```bash
helm install weahter-app weather-app-chart
```
To redeploy use:
```bash
helm upgrade weahter-app weather-app-chart
```
To delete use:
```bash
helm uninstall weahter-app weather-app-chart
