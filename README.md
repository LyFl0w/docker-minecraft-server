# docker-minecraft-server

## create image
```bash
docker build -t server-minecraft .
```

## run container
```bash
docker run -p 25565:25565 -v ./servermc:/server -it server-minecraft
```