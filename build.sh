docker build -t alpine-testenv .
docker tag alpine-testenv:latest amohoste/alpine-testenv:latest
docker push amohoste/alpine-testenv:latest