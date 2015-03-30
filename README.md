# Docker file for Apache Bloodhound 

**WARNING:** This container is ephemeral AND based on sqlite. You **WILL** lose all issues entered as soon as the container exits.

This thing should be linked to a MySQL container and modified accordingly. I am not even sure it is worth the effort when a VM would just do fine. Admin login and password are "admin".

This was mostly done as an experiment.

Run as follows: 

```
docker build -t bloodhound:0.8 https://github.com/tonigi/bloodhound.git
docker run -p 8080:8080 bloodhound:0.8
```
