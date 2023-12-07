image_tag=1021683053/nginxjs:alpine-nodejs18

docker buildx create --platform linux/amd64,linux/arm64 --name mybuilder --use
docker buildx build --platform linux/arm64,linux/amd64 -t $image_tag --push .