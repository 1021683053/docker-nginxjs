image_tag=1021683053/nginxjs:alpine-nodejs18
podman build --platform linux/arm64 --platform linux/amd64 --manifest $image_tag .
podman manifest inspect $image_tag
podman manifest push --all $image_tag docker://$image_tag
podman manifest rm $image_tag
