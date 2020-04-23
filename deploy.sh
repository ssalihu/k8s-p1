docker build -t 1after/api-java:latest -t 1after/api-java:$SHA -f ./client/Dockerfile ./api
docker build -t 1after/k8-p1-nginx:latest -t 1after/k8-p1-nginx:$SHA -f ./client/Dockerfile ./nginx
docker build -t 1after/counter:latest -t 1after/counter:latest -f ./counter/Dockerfile ./counter

docker push 1after/api-java:latest
docker push 1after/k8-p1-nginx:latest
docker push 1after/counter:latest
docker push 1after/api-java:$SHA
docker push 1after/k8-p1-nginx:$SHA
docker push 1after/counter:$SHA
