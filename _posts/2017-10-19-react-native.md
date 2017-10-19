---
layout: post
title: React Native 개발 경험 정리
---

<div class="message">
프로토타이핑 용도로 앱을 만들일이 있어 React Native를 사용해 봤다. 소문대로 HTML을 이용한 쉬운 네이티브 개발이 인상적이었다. 특히 간단한 구분을 통해 안드로이드/아이폰 모두를 지원하고, 사용자가 만든 다양한 컴포넌트를 골라 쓸 수 있는 것 또한 매력적이었다. 물론 아쉬운 점도 없잖아 있었는데 여기에는 실제로 처음부터 개발하면서 했던 경험들을 정리해본다.
</div>

*2017년 10월 19일 편집 및 게시*  
*2016년 6월 10일 초안 작성*

## 내용

*참고:  
아래 내용은 2016년 여름 기준이며,  
현재는 개발 도구 및 버전이 많이 변경 되었습니다.*

### 개요

AngularJS(2010)에 이어 React(2013) 등장. One-way data flow([Angular is known for it’s powerful two-way data-binding](https://toddmotto.com/one-way-data-binding-in-angular-1-5/)), Virtual DOM(고성능) 을 주요 기능으로 소개. 2015년 React Native 등장. HTML을 완전히 사용할 수 있는건 아니지만 디자인 레이아웃은 HTML/CSS와 유사한 형태로 구현한다. 제한적인 컴포넌트를 사용하며 API를 이용하면 추가도 가능하다. JSX 라는 js에 XML syntax를 추가한 preprocessor 단계를 사용한다. iOS/안드로이드 다른 구현이 존재.

### native 빌드

XCode 로 프로젝트를 열어 Release 모드로 설정하면 모든 리소스를 로컬에서 네티이브 빌드가 가능하다. 해보진 않았으나 안드로이드도 비슷할듯. 동시에 두 플랫폼을 개발하고 풍부한 node 라이브러리를 사용할 수 있는 점이 강점이다. 그러나 리액트에 익숙하지 않다면 다양한 시행착오로 상당한 시간을 소비하게되는 점은 유사하다. 후술한 디버깅 툴의 도움으로 개발 생산성이 지속적으로 향상되었다.

XCode로 빌드할때도 node가 필요하다. Build Phases를 보면 맨 마지막에 sh 파일이 있고 node로 실행되는 js 파일이다. 리액트가 디폴트 생성한 파일이며 따라서 필수적이다.

### 디버깅

시행착오를 줄여주는 [강력한 디버깅 툴 제공](https://facebook.github.io/react-native/docs/debugging.html). 디버깅 툴의 기능을 알아갈수록 개발 시간이 점점 단축됐다. `^ + ⌘ + Z` 디버깅 메뉴. Hot Reloading에 매우 만족. 그러나 UI가 아닌 전체 코드의 변경사항을 보려면 전체 reload가 필요하다. 결국 Live Reload만 사용하게 됐다. Remote JS Debugging은 별도 크롬 브라우저에서 콘솔 창(개발자 모드)으로 디버깅이 가능한 최고의 기능이며 이 기능을 활용하고 부터 개발 생산성이 획기적으로 향상됐다.

### Nuclide IDE

Nuclide IDE 환경은 매우 좋다. 리액트를 위한 최적의 환경을 제공한다. 크롬으로 보는 것도 편리하지만 디버깅 윈도우를 우측에 띄울 수 있어 매우 편하다. React Native server도 Nuclide 내에서 바로 띄울 수있다. 덩달아 Atom에도 익숙해졌다. [단축키를 IntelliJ 기준으로 맞추는 플러그인](https://atom.io/packages/intellij-idea-keymap) 사용 후 더욱 편해졌다. Atom을 주로 사용하다보니 상당히 트렌디한 느낌이다. Sublime은 트렌드에서 점점 밀리는 느낌.

디버거는 하나의 도구만 붙을 수 있다. 따라서 크롬/Nuclide 동시 디버깅은 불가능하며 Nuclide에 붙이는게 편하다. 크롬에서 이미 보고 있다면 Nuclide에 붙지 않는데 별도 오류 메시지가 없어서 한동안 원인 파악이 힘들었다.

### XML 처리

JSON 파싱이 디폴트로 편리하게 가능한 것과 달리 XML 파싱은 아예 제공조차 하지 않는다. 그러나 npm 모듈 중 [xmldom 라이브러리](https://stackoverflow.com/questions/29805704/react-native-fetch-xml-data)가 있어 [편리하게 이용](https://github.com/kaich/ASReact/blob/master/App/Main/TypePage.js)했다. node 기반인 React Natvie의 장점 중 하나다.

### 어려운 점

그러나 생각보다 모든 HTML 컴포넌트들이 한 번에 딱딱 붙는건 아니었다. 마음에 드는 형태로 보이게 하려면 여러차례 수정을 해야 했고 특히 HTML 만으로는 어디를 수정해야 되는지 명확히 파악하기 힘들었다. 이 부분은 오히려 네이티브일때가 훨씬 직관적이서 더 쉬운듯 하다.