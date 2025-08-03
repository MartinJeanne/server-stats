# general
Log de mon VPS :
sudo journalctl -u ssh --since "10 hour ago"

# caddy
docker logs -f --tail 10 caddy #logs de caddy
docker exec -w /etc/caddy caddy  caddy reload #gracefully reload caddy

# broadcast-server
sudo systemctl start broadcast-server.service
sudo systemctl stop broadcast-server.service
sudo systemctl status broadcast-server.service
sudo journalctl -u broadcast-server
