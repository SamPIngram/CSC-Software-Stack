# Docker Images

These docker images make the base for the applications available in the CSC Software Stack.

### Building/Running on M1 Macs:
docker buildx build --platform=linux/amd64 -t <image-name> .

docker run --platform=linux/amd64 -it <image-name>

### Functionality to Add:
- Licence checker CI
- bill of materials software
- Multiple language image building on release (github actions)

### Images TODO:
- Mega Dev (Most languages)
- R-studio (if open license)
- GATE
- Geant4
- TOPAS (Check license)

# TODOs
- figure out permissions can I install as abc in code-server (benefit for future modifications)
- Consolidate where I'm up to. Maybe cut down initial offering.
- Get extensions working for vscode (https://github.com/linuxserver/docker-code-server/issues/140)
- Check docker scout workflow to look at security on images.