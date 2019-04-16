---
layout: wiki 
title: PHP
---

<!-- TOC -->

- [Extending PHP](#extending-php)
    - [이후에 해볼 것](#이후에-해볼-것)

<!-- /TOC -->

# Extending PHP
[블로그 정리](http://dev.likejazz.com/post/173383191236/extending-php)

## 이후에 해볼 것
- C++ 파일 2개 이상 빌드
    - [Autotools](https://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html)를 이용한 방식, `config.m4` 숙지
    - CMake를 이용한 방식
- C++ 빌드 옵션, C와 차이점 검토
- PHP의 2d-array를 C++의 `zval`로 맵핑하여 처리하는 방법, 리턴값으로 array를 PHP로 돌려주기