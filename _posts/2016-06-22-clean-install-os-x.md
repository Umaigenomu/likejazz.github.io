---
layout: post
title: OS X 엘 캐피탄 클린 인스톨 정리
---

<div class="message">
<del>요세미티 출시에 발맞춰 OS X를 인스톨 했다. 새 술은 새 부대에 담는 느낌으로 아예 클린 인스톨을 했다. 노트북을 새로 산 느낌이다. 이후에 어떤 작업을 했고 어떤 데이타를 백업하고 복원했는지 기록을 남긴다.</del>

이 글은 원래 요세미티 출시와 함께 맥북에 클린 인스톨을 했던 경험의 기록이다. 그러나 엘 캐피탄 출시와 함께 업데이트된 내용을 추가해 최신 정보를 반영한다.
</div>

- *2016년 6월 22일 최신 내용 반영*
- *2015년 11월 26일 엘 캐피탄 업데이트*  
- *2015년 5월 19일 1차 개정*  
- *2014년 10월 23일 초안 작성*

## 목차
- [내용](#section)
  - [기본 설정](#section-1)
  - [인터넷](#section-2)
  - [크롬 익스텐션](#section-3)
  - [생산성](#section-4)
  - [커뮤니케이션](#section-5)
  - [문서](#section-6)
  - [이미지, 비디오](#section-7)
  - [콘솔, 개발 도구](#section-8)
  - [개인 자료](#section-9)
- [정리하며](#section-10)

## 내용

2016년 6월
<img src="https://c2.staticflickr.com/8/7333/27218763503_715ebb8a06_b.jpg" width="320" />
2015년
<img src="https://farm8.staticflickr.com/7673/17228888583_65c885c6d5_b.jpg" width="320" />

### 기본 설정
- Wi-Fi 네트워크 연결
- 보안등의 이유로 외부에서는 더 이상 Public Wi-Fi는 이용하지 않음. 밖에서는 아이폰을 테더링해 인터넷 사용.
- 마우스/키보드 감도 조절
- 키보드 설정에서 Caps Lock을 Control로 변경. 사실 맥에서는 Caps Lock, Control 키 둘 다 쓸 일이 별로 없다.
- Scroll Reverser. 터치패드의 자연스러운 움직임에는 익숙해졌으나 마우스까지 반대로 움직이는건 여전히 불편하다.
- 알림 센터(Notification Center)는 사용하지 않는다. 대시보드도 마찬가지. iOS 라면 몰라도 OS X 에는 어울리지 않는 기능 같다.
- 메뉴바 설정. 배터리 % 표시, 날짜 표시, 24 시간제로 변경.

### 인터넷
- 크롬 설치. 사파리의 깔끔함이 마음에 들지만 편리한 익스텐션 때문에 메인 브라우저는 크롬으로.
- 관심 있는 링크는 항상 [Delicious](http://likejazz.com/post/108592366618/delicious-com)에 저장해 왔으나 [이제는 삼류 서비스의 행태](http://likejazz.com/post/143509552915/leaving-deliciouscom)를 보여 아쉬움. 10년 넘게 사용해왔으나 점점 Pocket 사용 시간이 늘고 있다.
- Transmit. 이제 FTP를 직접 사용할 일은 드물지만 원격 FTP를 파인더의 폴더로 마운트 하는 기능은 편리하다. SFTP, AWS 등도 잘 지원한다.
- Wi-Fi Explorer. 더 이상 외부에서 아무 Wi-Fi나 사용할 일은 거의 없지만 그래도 가끔은 사용하게 되고 이 앱이 있으면 신호의 세기를 파악할 수 있다. 유료다.

### 크롬 익스텐션
- crxMouse Chrome Gestures 설치. 마우스 만으로 편리한 브라우징이 가능하다. vim 과 비슷한 단축키로 키보드만으로 브라우징이 가능한 익스텐션도 있는데 개인적으로 한 손으로 편하게 마우스로 브라우징 하는 방식을 선호한다.
- Native AdBlocker. 광고 차단. 안타깝게도.
- JSONView 익스텐션. JSON 을 브라우저에서 보기 편하게.
- Open Frame 익스텐션. 프레임을 별도 탭으로 여는 기능. 파이어폭스는 기본으로 지원하는데 크롬은 익스텐션으로 해결 가능하다.
- 네이버 영어사전(Naver English Dictionary). 다음 사전이 없어서 아쉽다.

### 생산성
- 포맷전에 백업 내용과 복원할 것들을 Evernote에 미리 기입해두었다. 앱스토어를 통해 다시 설치. 버전 관리를 위해 앱스토어에 있는 앱은 가능한 앱스토어를 통하는게 편하다.
- Dropbox 설치. 경쟁 서비스가 많지만 여전히 최고의 네트워크 드라이브다. iCloud Drive도 활용하는데 무엇보다 최신 앱들이 iCloud Drive 저장 기능을 제공하기 때문. 하지만 Find My Mac 을 제외한 다른 iCloud 기능은 사용하지 않는다.
- `~/bin` 설정. 콘솔에서 컴맨드로 처리해야할 모든 명령은 여기에 두고 Dropbox에 동기화 한다.
![bin](https://farm8.staticflickr.com/7761/17815084675_8082e6ece8_o.png "bin")
- <del>블로그에 올리는 이미지는 [Flickr Uploadr](https://www.flickr.com/tools/)를 통해 특정 폴더가 자동으로 업로드 되도록 하고 사용한다.</del> 유료로 전환하여 더 이상 사용하지 않음.
- iCal에 구글 캘린더를 동기화 한다.
- 최고의 GTD 도구 Things. 2009년에 정품 구매하여 지금까지 사용 중이다.
- Divvy. Cinch를 쓰다가 추천을 받아 정품을 구매해 사용 중이다. 요즘은 비슷한 무료 유틸리티도 많다.
- AppCleaner. 언인스톨러가 없는 맥에서 필수 유틸리티.
- LaunchBar. 2008년 부터 구매해서 사용 중. Spotlight가 좋아지고 Alfred 같은 대체 앱이 있어 예전에 비해 유용함은 많이 떨어지지만 습관적으로 사용 중.
- uTorrent. 설명이 필요 없는 토렌트 앱.
- [f.lux 밤에는 푸른 빛을 제거해 숙면](http://likejazz.com/post/147030510000/flux)을 돕는다.
- Wake Up Time - Alarm Clock. 요즘 아침마다 이걸로 일어난다.

### 금융 &amp; 보안
- 별도의 안티 바이러스 프로그램을 사용하지 않는 대신 Little Snitch 를 사용한다. 불필요한 네트워크 접속은 차단한다.
- 1Password. [SuperGenPass](http://www.supergenpass.com/)를 이용하다 비밀번호 자동 생성 만으로는 부족함이 있어 1Password를 구매해 사용 중. 서비스 별로 ID가 다른 경우도 있고 주기적으로 비밀번호를 다르게 바꿔야 할 때도 있는데 기억할 필요가 없어 매우 편하다.
- Junos Pulse. 사내망에 접속하기 위해 어쩔 수 없이 사용하는 VPN 프로그램. 그나마 버전업이 되면서 인터페이스가 많이 개선됐다.
- VMware Fusion. 국내에서 인터넷 쇼핑이나 결재를 하려면 여전히 필요하다.
- EZPlus for Mac. 신한 은행 인터넷 뱅킹 프로그램. 그래도 우리나라 은행이 맥에서 지원되는 것에 감지덕지하며 사용 중.

### 커뮤니케이션
- 카카오톡 메신저 설치.
- Slack. 팀 채널은 카톡으로 운영하다 최근에는 Slack으로 대체.

### 문서
- MS 오피스는 물론, 맥의 iWorks  사용하지 않는다. 왠만한 오피스 문서는 구글 드라이브로 해결하며, 가끔 Numbers 만 사용하고 있다.
- Deckset. 프리젠테이션도 마크다운으로. 간단한 발표 자료를 만들때 최고다.
- MindNode. 마인드맵을 그리며 생각을 정리하는 편인데, 프로그램을 쓰는게 오히려 더 불편해서 예전에는 그냥 종이에 직접 그리곤 했다. 그러나 이 프로그램을 발견하고 이 것만 사용. 직관적이다.
- Papers. 논문 관리 도구이나 이외 각종 PDF를 보관하고 관리하는데도 유용하다. 사진은 이미 Google Photos로 완전히 옮겨갔으나 PDF등은 특성상 온라인 서비스가 힘들다 보니 로컬에서 라이브러리를 관리하는 몇 안되는 도구 중 하나다. 다소 비싼게 유일한 흠이다.
- Balsamiq Mockup 3. 목업 개발도구로 미리 그림을 그려보기 좋다.
- Skitch. 업무상 필요한 캡처 이미지등은 이걸로 편집해서 공유한다.

### 이미지, 비디오
- Xee³. 빠른 이미지 뷰어.
- Pixelmator. 전문 디자이너가 아니다 보니 사진 편집은 이 정도만 해도 충분하다. 오히려 맥에선 포토샵 보다 훨씬 더 낫다는 평가.
- Sketch. 요즘 웹 디자인은 Sketch가 대세라고. 아직 잘 사용하진 못하는 편이다.
- GOM Player. Movist와 병행해서 사용 중이다. 둘 다 맥에서 동영상을 어려움 없이 볼 수 있게 해준다.
- Go for YouTube. 앱스토어에서 발견한 꿀 같은 메뉴바 앱이다. 유튜브를 음악 스트리밍 용도로 들을때 좋다.
- Air Video Server HD. 영화 파일을 맥에서 다운받으면 주로 스트리밍을 통해 아이패드 Air Video 앱에서 본다. 이 프로그램은 맥에 설치하는 스트리밍 서버다.

### 콘솔, 개발 도구
- iTerm2. 최고의 터미널 프로그램.
- 콘솔에서 `gcc`를 입력하면 자동으로 XCode를 설치하겠냐는 메시지가 뜬다. 선택하여 설치.
  - Command Line Tools 설치가 진행된다. 이후에 XCode도 따로 설치. 사실 XCode를 직접 쓸 일은 없으나 brew 에서 필요로 한다. OS X 앱 개발 할 일이 있더라도 AppCode를 선호하는 편이다.
- 개발 관련 디렉토리 생성. 지난 몇 년간 항상 `~/workspace`을 만들어 사용해오고 있으며, 요즘은 깃헙 프로젝트가 대부분이라 하위에 각 사이트별 URI 기준 디렉토리를 만들어 사용 중이다. 자바에서 net.daum 으로 시작하는 import 를 만드는 것과 비슷.
- [Tower](http://likejazz.com/post/133433602285/sourcetree-tower). 최고의 git 클라이언트. 처음엔 그냥 GitHub 공식 클라이언트를 사용하다 git-flow 때문에 SourceTree를 사용하게 됐고, 이후 완성형에 가까운 Tower로 갈아탐. 다소 비싼게 유일한 흠이다.
- bash, zsh를 사용하다 최종적으로 fish에 정착. 그 동안 서버에서 헷갈릴 수 있다는 이유로 bash를 고집하다 zsh의 편리함을 경험하고 바로 변경, 무거운 oh-my-zsh에 비해 prezto는 매우 가볍다. 그러다 콘솔의 완성형에 가까운 fish 로 정착. 그러나 비표준 쉘스크립트를 지원하기 때문에 스크립팅을 할때는 여전히 bash 활용. 아울러 fasd는 여전히 유용.
- Homebrew 설치. 더 이상 brew 없는 맥 콘솔은 상상할 수 없다. 너무 편하다. Tomcat 같은 어플리케이션을 시작으로 언어와 컴파일러까지 모든 개발 관련 도구는 brew를 통해 설치한다.
![brew](https://farm8.staticflickr.com/7671/17817653181_baf456dc32_o.png "brew")
- 반면 Cask는 오히려 혼란스러워 삭제.
- Tomcat, Gradle, Maven 모두 훌륭한 자바 도구들이다. 당연히 brew 로 설치.
- [Java for OS X 2014-001](https://support.apple.com/kb/DL1572?locale=ko_KR) 설치. Java 6으로 만들어진 앱을 실행하면 설치하겠냐고 자동으로 묻는다.
- JDK 8 설치
- JetBrains IDE 설치. [All Products Pack 연간 라이센스를 사용](http://likejazz.com/post/133725850005/jetbrains-all-products-pack)하고 있다. IntelliJ 뿐만 아니라 [CLion](http://likejazz.com/post/118649049333/clion-1-0), WebStorm, PhpStorm, PyCharm, AppCode등, RubyMine 빼고는 다 쓴다. RubyMine을 쓰지 않는 이유는 Ruby를 거의 안쓰기 때문일뿐, [가장 즐겨쓰는 최고의 IDE](http://likejazz.com/post/112670720955/jetbrains-ide)다.
- Android Studio 설치. IntelliJ에 여러가지 플러그인을 설치하다보면 느려지는 느낌이라 각각의 용도에 적합한 별도의 개발툴을 사용하는 편이다. 이외에도 Go를 위해서는 아예 Community Edtion에 Go 플러그인을 설치해 사용한다. 이미 난 정품 사용자 이지만 Java 개발을 제외한 환경에선 CE 버전을 적극 활용한다.
- 코딩을 할때는 항상 JetBrains의 IDE를 사용하지만 리뷰 용도나 간단한 작업시에는 [Sublime Text 3](http://likejazz.com/post/102824813705/sublime-text) 를 사용한다. [React Native 개발](http://dev.likejazz.com/post/145685053741/react-native)시 Atom + Nuclide를 사용해봤는데 생각외로 만족스러웠다. 이후 코드 편집기로 Atom 사용 빈도가 점점 늘고 있다. vim도 쓰긴 하지만 역시 GUI와 마우스를 병행할때 최고의 개발 생산성을 발휘한다고 생각한다.

### 개인 자료
개인 자료의 경우 사진과 비디오는 이미 Google Photos를 적극 활용하고 그외 블로그/기타 이미지 호스팅 용도로 Flickr를 활용한다. 비디오 중 공개적인건 YouTube에, 음악은 따로 다운받지 않고 스트리밍만 사용하고, 문서는 Dropbox와 iCloud Drive에 적절히 나눠 저장하고, MS 오피스 문서는 OneDrive에, 공개적인 코드는 GitHub에 회사 업무용은 사내 GitHub Enterprise에 둔다. 대부분의 개인 자료를 클라우드에 두다 보니 따로 백업이나 복원할게 없는 편이다.

## 정리하며
도구만 설치하면 각각의 클라우드에서 자료를 온전히 불러올 수 있는 세상이다. 한때 Thin-Client가 각광을 받았던 적이 있는데 Fat-Client의 장점인 High Performance/High Productivity/High Availability의 특징을 결합한 Smart-Client 시대가 됐다. 앞으로 점점 더 OS 포맷이 아무런 문제가 되지 않는 세상이 될 것이다.
