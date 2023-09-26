# Docker Images

These docker images make the base for the applications available in CSC Software Stack.

### Building/Running on M1 Macs:
docker buildx build --platform=linux/amd64 -t <image-name> .

docker run --platform=linux/amd64 -it <image-name>

### Functionality to Add:
- Licence checker CI
- software bill of materials (SBOM)
- Other docker scout checks

### Images TODO:
- Mega Dev (Most languages)
- GATE
- Geant4
- TOPAS (Check license)

# TODOs
- grafana stats board
- dashy
- streamlit_deploy
  - Sort for Pvt Githubs 
  - test 