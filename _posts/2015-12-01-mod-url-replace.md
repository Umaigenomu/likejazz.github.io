---
layout: post
title: URL 자동 변환 아파치 모듈
tags: [Network & Internet]
---

<div class="message">
오래된 URL을 신규 URL로 자동으로 변환해주는 아파치 모듈을 만들었다.
</div>

*2015년 12월 1일 1차 개정*  
*2015년 7월 17일 초안 작성*  

<!-- TOC -->

- [내용](#내용)
    - [패턴 적용](#패턴-적용)
    - [공개](#공개)

<!-- /TOC -->

## 내용

오래된 URL을 신규 URL로 변경해주는 작업이 필요 했다. 서버의 핸들러 또는 HTML 템플릿을 수정하지 않고 자동으로 임의의 변환된 결과를 얻어와 개발 생산성을 향상 시키고 싶었다. 원래 이런 용도로 외부 바이너리를 실행할 수 있는 **mod_ext_filter**, 정규식을 설정해서 치환하는 **mod_substitute** 가 있지만 좀 더 성능을 높여보고자 **mod_substitute** 를 기반으로 정규식을 걷어내고 패턴을 모듈에 내장하여 함께 컴파일 했다. 굳이 아파치 모듈을 직접 만든 이유는 고성능 때문이며 따라서 모든 패턴을 내장하여 함께 빌드한 것 또한 고성능이란 최종 목적에 잘 부합하는 방식이기도 하다.

### 패턴 적용

패턴을 내장했기 때문에 수정을 할때는 `mod_url_replace.c` 에서 코드를 직접 수정한 후 다시 컴파일해야 하는 번거로움이 있다. 다행히 아파치 모듈은 **apxs**로 손쉽게 빌드 가능하다. 

`$ apxs -i -a -c mod_url_replace.c`

아울러 모듈명은 url-replace 로 정했지만 URL 외에 다양한 룰도 얼마든지 적용이 가능하다. 아래는 패턴과 변환하려는 주소를 등록하는 방법이다.

{% highlight c %}
char *spdy_addr = "//t99.search.daumcdn.net/";

add_pattern(p, dcfg, "//t1.search.daumcdn.net/", spdy_addr);
add_pattern(p, dcfg, "//t2.search.daumcdn.net/", spdy_addr);
add_pattern(p, dcfg, "//t3.search.daumcdn.net/", spdy_addr);
add_pattern(p, dcfg, "//t4.search.daumcdn.net/", spdy_addr);
{% endhighlight %}

### 공개

원래 다른 모듈명으로 사내 CDN 주소 변경 용도로 만들었으나 정리하여 오픈소스로 공개한다. 공개하면서 일부 코드를 함께 정리했는데, 정리한 부분은 다시 사내 버전에 반영 하면서 상호 개선 효과를 얻을 수 있었다. 소스 코드는 단일 C 파일로 작성되어 있으며 [README](https://github.com/likejazz/mod-url-replace/blob/master/README.md) 에 이용 방법과 설치 방법을 상세히 기술했다.

[likejazz/mod-url-replace - GitHub](https://github.com/likejazz/mod-url-replace)
