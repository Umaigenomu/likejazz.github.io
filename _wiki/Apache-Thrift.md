---
layout: wiki 
title: Apache Thrift
---

<!-- TOC -->

- [프로토콜](#프로토콜)
- [Tutorial](#tutorial)
    - [Python](#python)
    - [실행 결과](#실행-결과)
    - [C++](#c)
        - [참고](#참고)

<!-- /TOC -->

# 프로토콜
- **RPC**(CORBA, DCOM, Java-RMI, .NET Remoting, ZeroC's ICE): 분산 컴퓨팅은 로컬 컴퓨팅과 근본적으로 다른데 RPC는 이러한 차이점을 감안하지 않고, 로컬과 동일한 방식으로 원격 호출을 수행하려는 한계를 지님.
- **SOAP**: HTTP + XML, verbose
- **REST**: REST or RESTful web services is a way of providing interoperability between computer systems on the Internet.
- **Apache Thrift**: is an interface definition language and binary communication protocol that is used to define and create services for numerous languages. It is used as a remote procedure call (RPC) framework and was developed at Facebook for "scalable cross-language services development".
  - Remote procedure call framework
- **Protocol Buffers**: Protocol buffers are Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data.
  - **gRPC**: high performance RPC framework that uses Protocol Buffers.

# Tutorial
&lt;Learning Apache Thrift&gt;, Packt, 2015 책의 챕터 7. An Example Client-Server Application을 실습해봤으나 `thrift EOFError readall()`가 발생했고 검색해봐도 비슷한 유형의 문제를 겪은 사례를 찾기 힘들었다. 아마 버전 차이로 인한 문제로 보였으나 결국 포기하고 공식 사이트의 튜토리얼을 다시 실습했다.

## Python
https://thrift.apache.org/tutorial/ 참고. 맥에서 설치는 brew로 진행했다. 그러나 C++에서는 코드 실행을 위한 lib가 필요하므로 소스를 직접 받아서 프로젝트 디렉토리에 두어야 한다.
```
thrift -r --gen py tutorial.thrift
```
파이썬 샘플은 https://thrift.apache.org/tutorial/py 참고. 스니펫은 전체 코드가 아니므로 링크로 접근하여 전체 코드를 받아서 실행한다.
## 실행 결과
<img src="http://docs.likejazz.com/images/2017/thrift.png" />

## C++
서버를 C++로 구현해보도록 한다. 

https://thrift.apache.org/tutorial/cpp 참고. 가이드에는 빌드 방법이 따로 없어 CMake로 빌드를 진행해보았다. C++ 11 버전으로 설정해야 `error: no member named 'bind' in namespace 'std';` 오류가 발생하지 않으며 gen-cpp의 소스까지 모두 빌드해야 한다. `-lthrift` 플래그를 설정하지 않으면 `ld: symbol(s) not found for architecture x86_64` 심볼을 찾지 못한다. brew로 설치했다면 `/usr/local/include`에 thrift header가, `/usr/local/lib`에 동적 라이브러리(dylib)가 이미 들어있다. skeleton은 빌드에서 제외하고 CMakeLists.txt의 전체 내용은 아래와 같다.

```
cmake_minimum_required(VERSION 3.7)
project(thrift_official)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        cpp/CppServer.cpp
        gen-cpp/Calculator.cpp
        gen-cpp/Calculator.h
        gen-cpp/shared_constants.cpp
        gen-cpp/shared_constants.h
        gen-cpp/shared_types.cpp
        gen-cpp/shared_types.h
        gen-cpp/SharedService.cpp
        gen-cpp/SharedService.h
        gen-cpp/tutorial_constants.cpp
        gen-cpp/tutorial_constants.h
        gen-cpp/tutorial_types.cpp
        gen-cpp/tutorial_types.h
        )

add_executable(thrift_official ${SOURCE_FILES})

set(LDFLAGS "-lthrift")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${LDFLAGS}")
```

실행 결과는 아래와 같다.
```
$ ./thrift_official 
Starting the server...
Incoming connection
        SocketInfo: <Host: ::1 Port: 60233>
        PeerHost: localhost
        PeerAddress: ::1
        PeerPort: 60233
```

### 참고
CLion에서 소스 파일이 비활성화 되는 문제가 있었는데, CMakeLists.txt를 임의로 만들어주고 프로젝트(.idea 디렉토리)를 삭제했다가 다시 오픈하니 잘 인식한다. 애초에 CMakeLists.txt가 없을때 imports로 열었는데 이후에 만들었지만 자동으로 인식하지 못했다.