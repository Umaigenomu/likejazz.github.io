# 깃헙 폴링 재시작 스크립트
깃헙을 폴링하다가 업데이트가 있을 경우 [Jekyll을 재시작하는 스크립트](https://gist.github.com/tracphil/91cf2c80aa6ce6a34555) 응용

```bash
#!/bin/sh
# This is a simple bash script that will poll github for changes to your repo,
# if found pull them down, and then rebuild and restart a API server.

while true
do
    # move into your git repo where your API server src is
    cd /home/deploy/workspace/go/src/github.daumkakao.com/iris/api

    git fetch;
    LOCAL=$(git rev-parse HEAD);
    REMOTE=$(git rev-parse @{u});

    # if our local revision id doesn't match the remote, we will need to pull the changes
    if [ $LOCAL != $REMOTE ]; then
        git pull origin master
        make
        killall api-v0.6
        # How to make output of any shell command unbuffered?
        # http://stackoverflow.com/a/25548995/3513266
        stdbuf -i0 -o0 -e0 nohup ./api-v0.6 >api.log 2>api.err &
    fi
    echo -n "."
    sleep 10 # every 10 seconds
done
```