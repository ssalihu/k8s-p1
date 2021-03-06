docker build -t 1after/api-java:latest -t 1after/api-java:$SHA ./api
docker build -t 1after/k8-p1-nginx:latest -t 1after/k8-p1-nginx:$SHA  ./nginx
docker build -t 1after/counter:latest -t 1after/counter:$SHA ./counter

docker push 1after/api-java:latest
docker push 1after/k8-p1-nginx:latest
docker push 1after/counter:latest
docker push 1after/api-java:$SHA
docker push 1after/k8-p1-nginx:$SHA
docker push 1after/counter:$SHA
