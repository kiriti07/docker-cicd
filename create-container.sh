#!/bin/sh

DOCKERHUB_USERNAME="kiriti7"
DOCKERHUB_PASSWORD="Kreative@Clicks@07"

folder_path="/home/ec2-user/my_nginx"
image_name="myweb_nginx"
container_name="my-nginx-container"

if [ -d "$folder_path" ]; then
  echo "Removing existing folder..."
  rm -rf "$folder_path"
fi

echo "Creating folder..."
sido -s mkdir -p "$folder_path"

echo "Folder removal and creation complete."

sudo -s docker build -t $image_name .

sudo -s docker run -d --name $container_name -p 8080:80 $image_name

sudo docker ps
output=$(docker ps)
echo "$output"

echo "$DOCKERHUB_PASSWORD" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin

docker push kiriti7/myweb_nginx:v1.0

echo "Docker Image is pushed successfully"

