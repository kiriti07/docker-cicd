#!/bin/sh

folder_path="/home/ec2-user/my_nginx"
image_name="myweb_nginx"
container_name="my-nginx-container"

if [ -d "$folder_path" ]; then
  echo "Removing existing folder..."
  rm -rf "$folder_path"
fi

echo "Creating folder..."
mkdir -p "$folder_path"

echo "Folder removal and creation complete."

sudo docker build -t $image_name .

sudo docker run -d --name $container_name -p 8080:80 $image_name

sudo docker ps
output=$(docker ps)
echo "$output"


