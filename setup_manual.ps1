podman rm -f mysql_container app_container nginx_container 2>$null
podman network rm db_network site_network 2>$null
podman volume rm db_volume 2>$null

podman network create db_network
podman network create site_network

podman volume create db_volume

# images
podman build -t mysql -f mysql/Dockerfile ./mysql
podman build -t app -f app/Dockerfile ./app
podman build -t nginx -f nginx/Dockerfile ./nginx

# conteneur MySQL
podman run -d `
  --name mysql_container `
  --network db_network `
  --network-alias mysql `
  -v db_volume:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=rootpassword `
  -e MYSQL_DATABASE=testdb `
  -p 5655:5655 `
  mysql
  
Start-Sleep -Seconds 20

# conteneur App
podman run -d `
  --name app_container `
  --network site_network `
  --network db_network `
  --network-alias app `
  -e DB_HOST=mysql `
  -e DB_PORT=5655 `
  -e DB_USER=user `
  -e DB_PASSWORD=example `
  -e DB_NAME=testdb `
  app

# conteneur Nginx
podman run -d `
  --name nginx_container `
  --network site_network `
  -p 5423:824 `
  -v ${PWD}/nginx/conf:/etc/nginx/conf.d:ro `
  nginx
