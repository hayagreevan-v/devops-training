## Docker Best practices & advanced concepts
	
- Container Registries
- Docker Compose
- Multi stage Builds
- Security Best practices
- Docker buildx
**Optional:**
- Overview about Docker Swarm
- Pros & Cons about Docker Swarm

## Resources

- Udemy - Section 11 (90-92)
- Udemy - Section 7 (Docker Compose)
- Udemy - Section 23 (Secuirty Best practices)
- Best practices
    - https://docs.docker.com/build/building/best-practices/
- Top 8 Docker Best Practices for using Docker in Production
    - https://www.youtube.com/watch?v=8vXoMqWgbQQ
- GitHub - dnaprawa/dockerfile-best-practices: Dockerfile Best Practices
    - https://github.com/dnaprawa/dockerfile-best-practices?tab=readme-ov-file

## Task - 6

**Frontend Layer :**
- Configure an nginx service with 1 replica using Docker Compose.
- Map port 80 of the container to port 8080 on the host.
- Use a custom nginx.conf file to log requests to a specific location (E.g: /var/log/nginx/access.log) and the logs should be persistent.
- Establish connection with Backend API

**Backend Layer :**
- 2 replicas of API using Flask or FastAPI or any framework of your choice. (Nginx should able to LoadBalance them)
- API using Flask or FastAPI or any framework of your choice.
- Backend should able to connect with database to return anything you like.

**Database Layer :**
- Set up a MySQL (or PostgreSQL) database service.
- Use envs to define the database name, user, and password. (or) use secrets if possible.
- Mount a volume to persist database data.

**Networking :**
- Frontend should be in seperate network (say public)
- Backend & Database layer in another network (say private)

**Observabality Layer :**
- Use prometheus exporters to scrape Nginx system metrics
- Ship nginx logs to Loki using Promtail
- Configure Loki in Grafana
- Visualise everything in Grafana  

	
## Links
- https://labex.io/tutorials/docker-how-to-add-or-remove-capabilities-using-docker-commands-411502
- https://stackoverflow.com/questions/64952485/nginx-prometheus-exporter-container-cannot-connect-to-nginx
- https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/
- https://nginx.org/en/docs/http/load_balancing.html