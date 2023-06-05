### This is a simple python application that allows to check weather in London.
**Requirements!**
Docker and curl should be installed on your local PC.
---

### How to
To build a docker image go to app-code directory and use command:
```bash
docker build -t your-repo/image-name:version-tag .
```
To run the application as a docker container locally use command:
```bash
docker run -p 8080:8080 your-repo/image-name:version-tag
```
Run next commands to test the application
```bash
curl http://localhost:8080/
curl http://localhost:8080/ping
curl http://localhost:8080/health
```
Have fun with testing. :smile:
