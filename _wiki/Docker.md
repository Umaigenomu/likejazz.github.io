---
layout: wiki 
title: Docker
---

<!-- TOC -->

- [기본 명령](#기본-명령)
- [중단, 재시작 명령 정리](#중단-재시작-명령-정리)
    - [참고](#참고)
- [Push a docker image to a private repo](#push-a-docker-image-to-a-private-repo)
- [CMD vs. ENTRYPOINT](#cmd-vs-entrypoint)
- [Books](#books)
    - [도커/쿠버네티스를 활용한 컨테이너 개발 실전 입문 <sub>2018, 2019</sub>](#도커쿠버네티스를-활용한-컨테이너-개발-실전-입문-2018-2019)

<!-- /TOC -->

# 기본 명령
정리 필요

# 중단, 재시작 명령 정리
중단하면서 컨테이너 삭제까지 병행

```
$ docker rm -f 7e555bde5128
```

2개의 볼륨을 마운트하고 종료시 자동으로 삭제되도록 foreground로 구동했다. 백그라운드는 `-it`를 제외하고 `-d`로 구동한다. `CMD`는 구동 마지막에 실행된다.

```
docker run --rm -it \
-v /Users/kaonpark/workspace/github.daumkakao.com/NLP/simpson:/simpson/simpson \
-v /Users/kaonpark/workspace/github.daumkakao.com/NLP/simpson-data:/simpson/simpson/data \
-p 5000:5000 \
--name simpson-ngine idock.daumkakao.io/kaon_park/simpson
```

최신 docker 이미지를 다른 포트에 중복 구동
```
sudo docker run -d -v ~/data:/simpson/simpson/data -p 5001:5000 abc.xxx.io/kaon_park/simpson
```

## 참고
업데이트가 있을 경우 [자동으로 이미지를 받아서 교체하는 스크립트](https://gist.github.com/likejazz/85c54f4c6b69e60cb7b75f806659153d)

# Push a docker image to a private repo
로그인, 태깅, 푸쉬 절차를 통해 업로드 할 수 있다.

```
$ docker login idock.daumkakao.io/kaon_park/fusion-tomcat
$ docker tag 8dde0f42c6b2 idock.daumkakao.io/kaon_park/fusion-tomcat
$ docker push idock.daumkakao.io/kaon_park/fusion-tomcat
```

# CMD vs. ENTRYPOINT
항상 헷갈린다. 주로 `CMD`로 처리했으며, `docker run` 이후에 실행된다.

- `CMD`: when container runs with a command, e.g., `docker run -it <image> /bin/bash`, CMD is ignored and bash interpreter runs instead.
- `ENTRYPOINT`: Shell form of ENTRYPOINT ignores any CMD or docker run command line arguments.

[RUN, CMD, ENTRYPOINT의 관계를 잘 정리한 글](http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/)

```
# Dockerfile
FROM ubuntu
ENTRYPOINT ["/bin/cat"]
```
and
```
$ docker build -t=cat .
```
then you can see:
```
$ docker run cat /etc/passwd
#                ^^^^^^^^^^^
#                    CMD
#            ^^^      
#            image (tag)- using the default ENTRYPOINT
```
[Link](https://stackoverflow.com/a/21558992/3513266)

아래는 php 어플리케이션을 구동하기 위해 몇 가지 수정한 Dockerfile이다.
```
FROM php:7-apache
LABEL maintainer="kaon.park@kakaocorp.com"

# 기본 포트가 80으로 설정되어 있어 sed로 교체한다.
ENV CONTAINER_PORT 18080
EXPOSE 18080
RUN sed -i "s/80/$CONTAINER_PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# CMD is the command the container executes by default when you launch the built image.
# A Dockerfile can only have one CMD.
# CMD docker-php-entrypoint apache2-foreground

# 개발시에는 VOLUME 설정을 하고 실서비스는 파일을 복사한다.
COPY ./demo/index.php /var/www/html/
```

# Books
## 도커/쿠버네티스를 활용한 컨테이너 개발 실전 입문 <sub>2018, 2019</sub>
- 도커 컨테이너 배포
- 스웜을 이용한 실전 애플리케이션 개발
- 쿠버네티스 입문/클러스터 구축
- 컨테이너 운영
- 가벼운 도커 이미지 만들기
