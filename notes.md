mkdir ./nginx_docker_files/cert/

## Aplications are in multiple docker container files
So there must be a shared network so they see each other

```bash
docker network create proxy_net
```

run 
```bash
docker compose -f docker-compose.yml -f docker-compose-dev.yml up -d --build
```