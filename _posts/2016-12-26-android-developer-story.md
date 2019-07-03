---
layout: post
title: 안드로이드 개발 경험 정리
tags: ["Software Development"]
---

<div class="message">
업무상 안드로이드 앱을 개발할 일이 생겨 진행 해봤다. 오래전부터 앱 하나쯤 만들어보려고 시도해봤으나 간단한 테스트외에 딱히 동기부여가 되지 않았고 시간이 없다는 핑계로 번번히 그냥 지나가곤 했다. 그러는 사이 안드로이드는 꾸준히 버전업하여 이미 API level 20에 다다랐다. 시간이 부족한건 마찬가지 이지만 최소한 구현해야할 스펙은 명확했고 이번에는 제대로 처음부터 만들어보고 개발 경험을 정리해봤다.
</div>

<small>
*2016년 12월 26일 편집 및 게시*  
*2014년 7월 25일 초안 작성*
</small>

## 본문

*참고: 아래 내용은 2014년 여름 기준이며 현재는 개발 도구 및 버전이 변경 되었습니다.*

<img src="https://31.media.tumblr.com/80af5408aa9b6ce288937cde4e54247a/tumblr_inline_n98vm0WqsZ1qzgoac.jpg" />

- 작년에 받아둔 Android Studio는 0.4 Alpha 버전이었는데 이제 Beta로 올라갔고 버전도 0.8이다. 당장 툴을 업그레이드 하는데서 부터 시작했다. 왜 Eclipse ADT가 아닌 Android Studio를 택했냐면 Eclipse의 느리고 무거움, 직관적이지 않음이 싫었고 Ant로 빌드환경을 구성하고 싶지 않았다. 게다가 [Java 개발툴로도 IntelliJ를 사용][1]하고 있기도 하다.
- Java니까 기존에 존재하는 Java의 풍부한 라이브러리를 그대로 활용할 수 있다. 탄탄한 Java 생태계의 도움을 받을 수 있다.
- 프로젝트 생성시 다양한 앱 이벤트에 대해 skeleton 코드를 생성해주는건 흡사 MFC로 Win32 프로그램을 만들면 다양한 generated 코드를 보여주는 것 같다. 하지만 난이도는 Visual C++ 보다는 Visual Basic에 더 가깝다. 이는 쉽다고 비아냥 대는게 아니라 그만큼 쉽게 잘 설계됐다는 얘기이기도 하다. 물론 Java에 이미 익숙해서 일수도 있고 Visual Studio보다 Android Studio가 좀 더 편해서 그럴 수도 있다.
- Stackoverflow는 위대하다. 각종 troubleshooting을 이 곳에서 파악할 수 있었다. 예전 Visual C++ 개발할때 codeguru나 codeproject를 참고하곤 했는데 거긴 질의 응답이 아니라 일종의 '개발 문서 & 예제 코드' 사이트다. 그러다보니 업데이트 주기도 늦고 문서도 풍부하지 않았다. 비슷한 주제의 문서에서 예제 코드를 추출해 한참동안 들여다보곤 했는데 이젠 정확히 일치하는 Stackoverflow 주제에서 정확하게 필요한 답변을 얻을 수 있으니 정말 편하다.
- 개발 정보를 계속 찾다보니 Stackoverflow만 나왔다. 이후에는 아예 검색창을 Stackoverflow로 고정하고 검색하기 시작했다.

<img src="https://31.media.tumblr.com/9946ca41b67a6055ce4ac2bc38f71ae5/tumblr_inline_n98vooKtOI1qzgoac.png" />

- 코드의 5할은 Stackoverflow가 채워줬고 3할은 github에서 차용했다. 내가 만든건 나머지 2할 뿐이다.
- intent-filter 속성 중 앱 실행에 관여하는 LAUNCHER와 deep link를 구성할 수 있는 BROWSABLE은 함께 명시할 수 없다. 그렇게하면 설치 후 ‘열기’ 버튼이 disabled 되고 launcher 아이콘이 보이지 않는다. intent-fileter를 두 번 만드는등 이를 피해갈 수 있는 work-around가 있지만 이렇게 하면 플레이스토어 등록은 당연히 거절될 것이다. 이 모든 경우는 Stackoverflow에 나와있으며 Activity를 2개 만들어 LAUNCHER와 BROWSABLE을 분리하는 것으로 해결했다.
- AVD는 너무 느려서 쓸만한 물건이 못된다. 하지만 디버깅을 위해 어쩔 수 없는 선택이기도 하다. [CPU를 x86으로 설정하고 Host GPU를 사용하는 방법][2]등이 그나마 도움이 된다.
- 디버깅하는데 [adb(Android Debug Bridge)][4]가 큰 도움이 됐다. 그런데 adb가 너무 편리하여 여기에 의존하다보니 testcase를 만들지 않고 계속 debug 관점에서만 접근한 점은 아쉬움으로 남는다.
- 최종 테스트를 위해선 결국 물리적인 기기에 연결해서 테스트가 필요한데 USB Debugging은 번거롭고 특히 PC가 아니라 맥과 연결하는건 잘 되지도 않았다. (LG 옵티머스 G) 그래서 간단한 Gradle 배포 task를 만들었고 아예 Dropbox로 배포해버렸다. 모바일에서 Dropbox에 접속해 apk를 설치했다. 일종의 원격 배포를 구현했고 매우 편했다.
- 이 분야도 개선 속도가 빠르다 보니 1년전 tutorial이 벌써 deprecated에 가깝다. 예를 들어 fragments가 어느새 activity의 필수 요소에 포함된 것등이고 최신 버전으로 생성해보면 PlaceholderFragment를 만들어 쓰는데 비교적 최신 tutorial을 봐야 이에 대한 예제가 나온다. 몇 년전에 사둔 안드로이드 개발 책은 전혀 도움이 되지 않았고(안드로이드의 개발 역사를 되짚어 보겠다면 모르겠으나) 그런면에서 갱신 속도가 빠른 Stackoverflow가 다시 한 번 도움이 됐다.
- 마음 같아선 ‘Android L’로 최신 기능(예를 들어 Material Design)을 마음껏 쓰고 싶었지만 범용성을 무시할 수 없다보니 4.1 Jelly Bean 기준으로 개발했다. API level 16이고 발표일은 2012년 7월이다. 프로젝트 생성할때 보면 현재 77% 기기에 대응된다고 나온다.
- [안드로이드도 API 가이드][3]도 문서화가 잘 되어 있어 큰 도움이 됐다. Visual C++ 개발시 msdn이 도움이 되는 것과 비슷하다.
- 안드로이드 앱도 Win32 프로그램 처럼 이벤트가 참 많다. 앱 개발시 각 이벤트 대응 설계를 제대로 하지 않으면 나중에 큰 재앙이 올 수 있겠다는 생각을 했다.

[1]: http://dev.likejazz.com/post/91299507871/intellij-gradle-lombok
[2]: http://stackoverflow.com/questions/1554099/why-is-the-android-emulator-so-slow
[3]: http://developer.android.com/guide/index.html
[4]: http://developer.android.com/tools/help/adb.html