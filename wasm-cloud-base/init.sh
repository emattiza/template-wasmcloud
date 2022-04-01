echo "127.0.0.1\tregistry" | sudo tee -a /etc/hosts > /dev/null
docker-compose -f wasm-cloud-base/docker-compose.yml pull
