# docker-minecraft-server

## generate source for creating image
Use vscode task manager plugin and clean compile spigot, bungeecord, paper

## create all images
```bash
chmod +x build-docker-image.sh
./build-docker-image.sh
```

## run container
You can use spigot, paper or bungeecord for the tags
```bash
docker run -p 25565:25565 -v ./servermc:/server -it server-minecraft:xxxx
```

## run docker compose example
```bash
docker compose up -d
```