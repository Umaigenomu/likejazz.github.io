---
layout: post
title: Clean Install OS X Yosemite
---

<div class="message">
  요세미티 출시에 발맞춰 OS X를 인스톨 했다. 새 술은 새 부대에 담는 느낌으로 아예 클린 인스톨을 했다. 노트북을 새로 산 느낌이다. 이후에 어떤 작업을 했고 어떤 데이타를 백업하고 복원했는지 기록을 남긴다.
</div>

*2014년 10월 23일 초안 작성*

## 내용

<img src="https://farm8.staticflickr.com/7673/17228888583_65c885c6d5_b.jpg" width="384" />

### 기본 설정

- Wi-Fi 네트워크 연결
- 마우스/키보드 감도 조절
- 키보드 설정에서 caps lock을 control로 변경. 더 이상 caps lock은 사용하지 않는다.
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/). 터치패드의 자연스러운 움직임에는 익숙해졌으나 마우스까지 반대로 움직이는건 여전히 불편하다.
- 알림 센터(Notification Center)는 사용하지 않는다. 대시보드와 마찬가지로.
- 메뉴바 설정. 배터리 % 표시, 날짜 표시, 24 시간제로 변경 등.

### 인터넷

- Chrome 설치. Safari를 계속 쓸까 했는데 아직은 크롬이 더 편하다.
- [CrxMouse Chrome Gestures](https://chrome.google.com/webstore/detail/crxmouse-chrome-gestures/jlgkpaicikihijadgifklkbpdajbkhjo?hl=en) 설치. 평소 즐겨쓰던 마우스 gestures extension이 더 이상 동작하지 않는다. 다시 검색해서 이 extension으로 설치.
- 문서는 Pocket으로, 링크는 Delicious에 저장한다. 둘 다 공식 익스텐션 사용 중.
- 당연히 광고도 제거. AdBlock 익스텐션.
- 사내 커뮤니케이션을 위한 Agit Notifier.
- Vimium을 써보는 중이다.

### 생산성

- 포맷전에 백업 내용과 복원할 것들을 Evernote에 미리 기입해두었다. 내용을 다시 꺼내기 위해 처음에는 evernote.com에서 설치했다가 버전 관리를 위해 앱스토어를 통해 재설치했다. 앱스토어에 있는 앱은 가능한 앱스토어를 통하는게 관리하기 편하다.
- Dropbox, OneDrive 설치. 네트워크 드라이브로 이 두 서비스를 이용한다. OneDrive는 주로 MS-Office 용도이고 Dropbox는 pdf를 포함한 나머지 파일을 저장한다. 이외 iCloud Drive도 활용하는데 이건 따로 설치할 필요가 없다. 유일하게 iCloud에서 사용하는 서비스가 iCloud Drive와 Find my Mac 이다.  
- `~/bin` 설정. 콘솔에서 컴맨드로 처리해야할 모든 명령은 여기에 두고 Dropbox에 동기화 해둔다.
![bin](https://farm8.staticflickr.com/7761/17815084675_8082e6ece8_o.png "bin")
- 블로그 용도의 이미지는 [Flickr Uploadr](https://www.flickr.com/tools/)를 통해 특정 폴더가 자동으로 업로드 되도록 하고 사용한다.
- iStumbler 설치. <strike>출장 갔을때 호텔방에서 Wi-Fi 잡으려면 필수다.</strike> 요즘은 그냥 아이폰에서 핫스팟을 만들어 사용한다. 한 달 데이타를 8G로 했더니 충분히 여유있다. 밖에서 동영상도 그냥 보는 편이다. 무료 Wi-Fi 찾느라 스트레스 받고 보안 문제에 시달리느니 이 편이 훨씬 낫다.
- <strike>주소록 동기화. Facebook, Daum Exchange, Google등 연동해서 각각에 저장된 주소록을 동기화한다.</strike>
- iCal 설정. 구글 캘린더 동기화.
- 카카오톡 메신저 설치.
- Things. 5년 넘게 애용해온 최고의 GTD 도구.
- Divvy. Cinch 쓰다가 추천을 받아서 정품 구매해 사용 중이다.
- iTerm. 기본 터미널에 적응해보려 했으나 몇 가지 불편한 점이 있어 결국 설치.
- 웹 기반이 편하다 보니 오피스는 사용하지 않는다. MS 오피스는 물론, 맥의 iWorks 도 사용하지 않는다. 웹에서 즉시 브라우징 가능한게 가장 편하다.
- AppCleaner. 언인스톨러가 없는 맥에서 필수 유틸리티
- Deckset. 프리젠테이션도 마크다운으로. 간단한 발표 자료 만들때 최고다.
- <strike>LaunchBar. 이 것도 6년 넘게 쓰고 있다. Spotlight가 좋아져서 계속 필요한지는 고민 중이다.</strike> 기본 Spotlight 만으로 훌륭해서 더 이상 별도의 런처가 필요하지 않다.
- 나는 [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) 정품 사용자다. 어떤 앱이 얼마만큼의 네트워크를 사용하는지 모니터링하고 차단할 수 있다.
- 1 Password. [SuperGenPass](http://www.supergenpass.com/)를 이용하다 비밀번호 자동 생성 만으로는 부족함이 있어 1 Password를 구매해 사용한다. 서비스 별로 ID가 다른 경우도 있고 비밀번호를 다르게 바꿔야 할 경우도 있는데 기억할 필요가 없어 매우 편하다.
- Junos Pulse. 외부에서 사내망에 접속하기 위해선 어쩔 수 없이 써야하는 VPN 앱이다. 항상 그렇듯 비지니스용 앱의 사용성에는 큰 기대를 하지 않는게 좋다.
- Transmit. 이제 FTP를 사용할 일이 극히 드물지만 유료임에도 불구하고 돈 값을 한다는 느낌이다. 게다가 원격 FTP를 파인더의 폴더로 마운트 하는 기능이 있어 편리하다.
- VMware Fusion. 우리나라에서 인터넷 쇼핑이나 결재를 하려면 반드시 필요한.

### 생활, 엔터테인먼트

- Pixelmator. 포토샵 대용인데 사실 전문 디자이너가 아니다 보니 이 또한 버겁다. 조만간 다른 가벼운 앱으로 갈아타려고 준비 중.
- EZPlus for Mac. 신한 은행 인터넷 뱅킹앱. 허접하지만 그래도 지원되는거에 감지덕지하며 사용 중.
- uTorrent. 필수.
- GOM Player. Movist는 아쉽게도 유료임에도 불구하고 그에 걸맞는 탁월한 성능을 보여주진 못한다. VLC가 가장 훌륭하지만 GOM Player 도 한국적인 기능을 제공하는등 나쁘지 않아 만족하며 사용 중이다.
- Go for YouTube. 앱스토어에서 발견한 꿀 같은 메뉴바 앱이다. 유튜브를 음악 스트리밍 용도로 들을때 더욱 좋다.

### 콘솔, 개발 도구

- 콘솔에서 `gcc`를 입력하면 자동으로 XCode를 설치하겠냐는 메시지가 뜬다. 선택하여 설치.
- Command Line Tools 설치가 진행된다. 이후에 XCode도 따로 설치. 사실 XCode를 직접 쓸 일은 없다. 만약 OS X 앱 개발 할 일이 있더라도 AppCode 쪽이 훨씬 편하다.
- 개발 관련 디렉토리 생성. 지난 몇 년간 항상 `~/workspace`을 만들어 사용했다.
- github.com 공개 프로젝트를 위한 `~/workspace/github.com` 별도 생성. 워낙에 clone을 많이 받았더니 이제 이 디렉토리 용량만도 상당하다.
- github 클라이언트 설치. 콘솔에서 컴맨드로 일일이 셋팅하는건 번거롭다. 클라이언트를 설치해 디렉토리만 지정하면 나머지 모든 설정은 이 앱이 알아서 처리한다. 심지어 .ssh 설정 까지도.
- <strike>.profile 맵핑. gist에 올려두고 공개 관리하고 있다.</strike>
- bash 말고 zsh 이용. 그 동안 서버에서 헷갈릴 수 있다는 이유로 bash를 고집했으나 zsh의 편리함을 경험하고 바로 변경. 게다가 [prezto](https://github.com/sorin-ionescu/prezto)는 매우 훌륭하다. 처음엔 oh-my-zsh를 사용했으나 너무 느려 갈아탐.
- Homebrew 설치. 콘솔/개발도구는 이거 하나면 뭐든지 설치할 수 있다. 너무 편하다. 최고다. brew를 통해 설치한 팩키지를 따로 관리해야할 정도. 툴 뿐만 아니라 Tomcat 같은 어플리케이션, 심지어 언어와 컴파일러까지.
![brew](https://farm8.staticflickr.com/7671/17817653181_baf456dc32_o.png "brew")
- 반면 Cask는 오히려 앱 관리하기가 혼란스러워 삭제.
- Tomcat, Gradle, Maven 훌륭한 자바 도구들이다. 당연히 brew로 설치한다.
- [Java for OS X 2014-001](https://support.apple.com/kb/DL1572?locale=ko_KR) 설치. Java 6으로 만들어진 앱을 실행하면 자동으로 설치하겠냐고 묻는다.
- JDK 8 설치
- JetBrains IDE 설치. IntelliJ를 비롯하여 [CLion](http://likejazz.com/post/118649049333/clion-1-0), WebStorm, PyCharm, AppCode 등. [가장 즐겨쓰는 최고의 IDE다](http://likejazz.com/post/112670720955/jetbrains-ide).
- Android Studio 설치. IntelliJ에 여러가지 플러그인을 설치하다보면 느려지는 느낌이라 각각의 용도에 적합한 별도의 개발툴을 사용하는 편이다. 이외에도 Golang을 위해서는 아예 Community Edtion에 Go 플러그인을 설치해 사용한다. 참고로 나는 엔터프라이즈 정품 사용자다.
- 코딩을 직접 할때는 항상 JetBrains의 IDE를 사용하지만 리뷰 용도나 간단한 작업시에는 [Sublime Text 3](http://likejazz.com/post/102824813705/sublime-text) 또는 Visual Studio Code를 이용한다. Atom, Brackets등의 다른 에디터는 사용하지 않는다. vim도 주로 쓰지만 가능하면 GUI 도구를 사용하는 편이다.

## 정리하며

개인 자료의 경우 사진과 비디오는 이미 Flickr, Google+, 비디오 중 공개적인건 YouTube에, 음악은 따로 다운받지 않고 스트리밍만 사용하고, 문서는 Dropbox와 iCloud Drive에 적절히 나눠 저장하고, 오피스 문서는 OneDrive에, 코드는 공개적인건 GitHub에 회사 업무용은 사내 GitHub Enterprise에 둔다. 대부분의 개인 자료를 클라우드에 두다 보니 따로 백업이나 복원할게 없다. 도구만 설치하면 자료는 그대로 불러올 수 있다. 점점 더 OS 포맷이 부담 없는 세상이 되어간다.
