# Less is exponentially more
['적은'것은 기하급수적으로 '많은'거다.](https://commandcenter.blogspot.kr/2012/06/less-is-exponentially-more.html)  
Rob Pike의 Go over C/C++ 특징을 잘 정리한 컬럼  
[Why Go?](https://dave.cheney.net/2017/03/20/why-go)  
This article contains three salient reasons why I think Go is an important programming language.

# Method Overloading in Go
Go에는 메소드 오버로딩이 없다. 자바에서 매우 편리하게 사용하던 기능인데 [Go FAQ에 지원하지 않음이 명시](https://golang.org/doc/faq#overloading)되어 있음  
- 타입 매칭(파라미터)이 없으면 메소드 전달이 단순화됨
- 실제로는 혼란스럽고 깨지기 쉽다.
- 이름으로만 매칭되는 타입 일관성 유지는 Go 타입 시스템의 주요 결정 사항

Workaround: [Function and Method Overloading in Golang](http://changelog.ca/log/2015/01/30/golang)

# struct 없이 JSON parsing
```
var v map[string]string
err := json.Unmarshal([]byte(res), &v)
assert.Equal(t, "ERROR", v["STATUS"])
```

# gopkg.in go get 처리 되지 않는 문제
`glide get gopkg.in/yaml.v2`이 안되는 문제가 있는데 https://github.com/Masterminds/glide/issues/449 에 따르면 git 자체의 문제로 보인다. `git config --global http.sslVerify true`를 하면 된다고 되어 있으나 SSL 처리는 그렇게 되는게 맞지만(`false`인 경우,
```
➜  sandbox git clone https://gopkg.in/yaml.v2
Cloning into 'yaml.v2'...
fatal: unable to access 'https://gopkg.in/yaml.v2/': Unknown SSL protocol error in connection to gopkg.in:-9838
```
이렇게 오류 발생) true로 해도 301 오류로 처리되지 않았다.
```
➜  sandbox git clone https://gopkg.in/yaml.v2
Cloning into 'yaml.v2'...
error: RPC failed; HTTP 301 curl 22 The requested URL returned error: 301
fatal: The remote end hung up unexpectedly
```
즉, 뭔가 redirect 처리가 되지 않는 문제이며 https://github.com/niemeyer/gopkg/issues/50 이 문서에서 제시한 `git config --global http.https://gopkg.in.followRedirects true` workaround로 해결 가능했다. 이 설정이 되어 있지 않아도 다른 사람은 문제 없는데 왜 내 경우에만 발생하는지는 별도로 추가 확인이 필요하다.

최종 .gitconfig는 아래와 같은 형태로 구성되었다.
```
[user]
        name = Sang-Kil Park
        email = kaon.park@daumkakao.com
[http]
        sslVerify = true
[http "https://gopkg.in"]
        followRedirects = true
```