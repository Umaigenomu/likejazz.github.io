---
layout: post
title: macOS 설치 프로그램 정리
---

<div class="message">
이 글은 원래 요세미티 출시와 함께 맥북에 클린 인스톨을 했던 경험의 기록이다. 그러나 엘 캐피탄 출시와 함께 업데이트된 내용을 추가했고 이후 꾸준히 갱신하여 맥북 프로 터치바에 시에라 셋팅을 마친 기록까지 최종 정리해 보았다.
</div>

*2017년 1월 20일 맥북 프로 터치바 셋팅*  
*2016년 6월 22일 최신 내용 반영*  
*2015년 11월 26일 엘 캐피탄 업데이트*  
*2015년 5월 19일 1차 개정*  
*2014년 10월 23일 초안 작성*

## 목차
- [내용](#section-1)
  - [기본 설정](#section-2)
  - [인터넷](#section-3)
  - [크롬 익스텐션](#section-4)
  - [생산성](#section-5)
  - [금융 & 보안](#section-6)
  - [커뮤니케이션](#section-7)
  - [문서](#section-8)
  - [이미지, 비디오](#section-9)
  - [콘솔, 개발 도구](#section-10)
  - [개인 자료](#section-11)
- [정리하며](#section-12)

## 내용

<img src="/images/2017/touchbar.jpg" width="99%" />  
<img src="https://c2.staticflickr.com/8/7333/27218763503_715ebb8a06_b.jpg" width="49%" align="left" style="margin-right: 10px" /><img src="https://farm8.staticflickr.com/7673/17228888583_65c885c6d5_b.jpg" width="49%" />
*2017년 1월 맥북 프로 터치바(상단), 2016년 6월(하단 좌)과 2015년(하단 우)의 모습*

### 기본 설정
- Wi-Fi 네트워크 연결
  - 보안등의 이유로 외부에서는 더 이상 Public Wi-Fi는 이용하지 않음. 밖에서는 아이폰을 테더링해 인터넷 사용
- 키보드 감도를 가장 짧게 조정
- 트랙패드 '탭하여 클릭하기'가 기본 비활성화 되어 있다. 환경설정에서 클릭하여 활성화
- 시에라에서는 Caps Lock 키가 한/영 변환 디폴트가 되었다. 그대로 사용하려 했으나 새끼 손가락이 너무 아프다. 다시 컴맨드+스페이스로 변경
- 알림 센터(Notification Center)는 사용하지 않는다. 대시보드도 마찬가지. iOS에만 있어야 할 기능인데 억지로 macOS에 배치한 느낌이다.
- 메뉴바 설정. 배터리 % 표시, 날짜 표시, 24시간제로 변경

### 인터넷
- **크롬** 설치. 사파리의 깔끔함이 마음에 들고 2017년 1월 현재 사파리만 터치바를 지원하지만 북마크/비밀번호 동기화와 편리한 익스텐션 때문에 메인 브라우저는 크롬으로 사용
- 관심 있는 링크는 항상 [Delicious](http://likejazz.com/post/108592366618/delicious-com)에 저장해 왔으나 [이제는 삼류 서비스의 행태](http://likejazz.com/post/143509552915/leaving-deliciouscom)를 보여 아쉬움. 10년 넘게 사용해왔으나 점점 **Pocket** 사용 시간이 늘고 있다.
- **Wi-Fi Explorer(유료)** 더 이상 외부에서 아무 Wi-Fi나 사용할 일은 없지만 신호의 세기를 파악할 수 있다.

### 크롬 익스텐션
- **crxMouse Chrome Gestures** 마우스 만으로 편리한 브라우징이 가능하다. vim 과 비슷한 단축키로 키보드만으로 브라우징이 가능한 익스텐션도 있는데 개인적으로 한 손으로 편하게 마우스로 브라우징 하는 방식을 선호한다.
- **JSONView** JSON 을 브라우저에서 보기 편하게
- **Open Frame** 프레임을 별도 탭으로 여는 기능. 파이어폭스는 기본으로 지원하는데 크롬은 익스텐션으로 해결 가능하다.
- 번역 도구로 **Google Translate** 사용. 딥러닝이 적용된 구글 번역의 품질은 매우 훌륭하다.
- 이제 Pocket을 이용하기 때문에 **Save to Pocket** 익스텐션도

### 생산성
- 앱스토어에 있는 앱은 버전 관리를 위해 가급적 앱스토어를 통해 설치하는게 편하다.
- 포맷전에 백업 내용과 복원할 것들을 **Evernote** 에 미리 기입해두었다. 이외 다양한 메모 용도로 적극 활용한다.
- **Dropbox** 경쟁 서비스가 많지만 여전히 최고의 네트워크 드라이브다. iCloud Drive도 활용하는데 무엇보다 최신 앱들이 iCloud Drive 저장 기능을 제공하기 때문. 하지만 Find My Mac 을 제외한 다른 iCloud 기능은 사용하지 않는다.
- `~/bin` 설정. 콘솔에서 컴맨드로 처리해야할 모든 명령은 여기에 두고 Dropbox에 동기화 한다.
<img src="https://c2.staticflickr.com/8/7489/27549796853_3faae680f0_b.jpg" width="512" />
- **캘린더** 에 구글 캘린더를 동기화 한다.
- 최고의 GTD 도구 **Things(유료)** 2009년에 정품을 구매하여 지금까지 사용 중 이다.
- **Divvy(유료)** Cinch를 쓰다가 추천을 받아 정품을 구매해 사용 중이다. 요즘은 비슷한 무료 유틸리티도 많다.
- **AppCleaner** 언인스톨러가 없는 맥에서 필수
- **LaunchBar(유료)** 2008년 부터 구매해서 사용 중. Spotlight가 좋아지고 Alfred 같은 대체 앱이 있어 예전에 비해 유용함은 많이 떨어지지만 이미 구매했던거라 습관적으로 사용 중. 생각보다 사용빈도는 낮은 편이다.
- **uTorrent** 설명이 필요 없는 토렌트 앱
- [f.lux 밤에는 푸른 빛을 제거해 숙면](http://likejazz.com/post/147030510000/flux)을 돕는다.
- **Wake Up Time - Alarm Clock** 요즘 아침마다 이걸로 일어난다.
- 여러가지 많이 설치해 쓰다보니 메뉴바가 너무 복잡하다. **Bartender(유료)** 로 정리한다.

### 금융 & 보안
- 별도의 안티 바이러스 프로그램을 사용하지 않는 대신 **Little Snitch(유료)** 를 사용한다. 불필요한 네트워크 접속은 차단한다.
- **1Password(유료)** [SuperGenPass](http://www.supergenpass.com/)를 이용하다 비밀번호 자동 생성 만으로는 부족함이 있어 1Password를 구매해 사용 중. 서비스 별로 ID가 다른 경우도 있고 주기적으로 비밀번호를 다르게 바꿔야 할 때도 있는데 기억할 필요가 없어 매우 편하다.
- **Junos Pulse** 사내망에 접속하기 위해 어쩔 수 없이 사용하는 VPN 프로그램. 그나마 버전업이 되면서 인터페이스가 많이 개선됐다.
- **VMware Fusion(유료)** 을 줄곧 사용해오다 비싼 가격으로 Virtual Box로 이동하려 했으나 기존 이미지 파일을 복구하려면 방법이 없다. 윈도우를 다시 설치할 엄두가 나지 않아 어쩔 수 없이 계속 사용
- **EZPlus for Mac** 신한 은행 인터넷 뱅킹 프로그램. 그나마 우리나라 은행에서 맥 지원이 되는 것에 감사하며 사용 중

### 커뮤니케이션
- **카카오톡** 메신저 설치
- **Slack** 팀 업무용 커뮤니케이션 채널로 사용

### 문서
- MS 오피스는 물론, 맥의 iWorks도 사용하지 않는다. 왠만한 문서는 **구글 드라이브** 로 해결하며 가끔 Numbers만 사용하고 있다.
- **Deckset(유료)** 프리젠테이션도 마크다운으로. 간단한 발표 자료를 만들때 좋다.
- **MindNode(유료)** 마인드맵을 그리며 생각을 정리하는 편인데, 프로그램을 쓰는게 오히려 더 불편해서 예전에는 그냥 종이에 직접 그리곤 했다. 그러나 이 프로그램을 이용하면서 부터는 이걸로 그린다.
- **Papers(유료)** 논문 관리 도구로 각종 PDF를 보관하고 관리하는데도 유용하다. 사진은 이미 Google Photos로 완전히 옮겨갔으나 PDF는 사이즈가 크다 보니 로컬에서 라이브러리를 관리하는 몇 안되는 도구 중 하나. Documents 폴더 하위에 라이브러리만 백업하면 다른 맥에서도 복원 가능하다. 다소 비싼게 유일한 단점.
- **Skitch** 업무상 필요한 캡처 이미지등은 이걸로 편집해서 공유한다.

### 이미지, 비디오
- **Xee³(유료)** 빠른 속도 뿐만 아니라 편리한 브라우징이 돋보이는 최고의 이미지 뷰어
- Pixelmator(유료)를 사용해오다 요즘은 다시 **포토샵(유료)** 사용 중. 간단한 편집시에는 좀 더 가벼운 도구를 사용하고 수정이 많이 필요한 경우에만 가끔 실행한다.
- **Sketch(유료)** 요즘 웹 디자인은 Sketch가 대세라고. 아직 잘 사용하진 못하는 편으로 얼마전에 익힌 **Adobe XD** 를 많이 사용 중이다.
- **GOM Player** 버전업이 중단되었지만 크게 불편함 없이 계속 사용 중
- **Go for YouTube** 앱스토어에서 발견한 꿀 같은 메뉴바 앱이다. 유튜브를 음악 스트리밍 용도로 들을때 좋다.
- **Air Video Server HD(유료)** 영화 파일을 맥에서 다운받으면 주로 스트리밍을 통해 아이패드 Air Video 앱에서 본다. 이 프로그램은 맥에 설치하는 스트리밍 서버다.
- **ImageOptim** 사진을 공개된 인터넷에 업로드 할때는 개인정보 보호를 위해 반드시 EXIF 정보를 삭제한다.

### 콘솔, 개발 도구
- **iTerm2** 최고의 터미널 프로그램
- 콘솔에서 `gcc`를 입력하면 자동으로 XCode를 설치하겠냐는 메시지가 뜬다. 선택하여 설치.
  - Command Line Tools 설치가 진행된다. 이후에 XCode도 따로 설치. brew를 설치할때도 마찬가지로 Commend Line Tools 설치가 진행된다.
- 개발 관련 디렉토리 생성. 지난 몇 년간 항상 `~/workspace`을 만들어 사용해오고 있으며, 요즘은 깃헙 프로젝트가 대부분이라 하위에 각 사이트별 URI 기준 디렉토리를 만들어 사용 중이다. 자바에서 net.daum 으로 시작하는 import 를 만드는 것과 비슷.
- **[Tower](http://likejazz.com/post/133433602285/sourcetree-tower)(유료)** 최고의 git 클라이언트. 처음엔 그냥 GitHub 공식 클라이언트를 사용하다 git-flow 때문에 SourceTree를 사용하게 됐고, 이후 완성형에 가까운 Tower로 갈아타다. 다소 비싼게 유일한 흠이다.
- 어느덧 zsh & **oh my zsh** 가 대세가 됐다. 그간 무거워서 사용하지 않았으나 최근 플러그인 구조도 많이 가벼워지고 fish의 도무지 적응 안되는 문법으로 인해 다시 zsh 기반으로 이전
  - **fasd** 는 `brew install fasd`로 별도 설치. `.zshrc`의 `plugins` 설정에 fasd를 추가하면 편리한 aliases를 사용할 수 있다.
  - 플러그인은 **git history python fasd history-substring-search web-search** 를 사용 중이다. 히스토리 사이즈는 100000으로 늘리고, stackoverflow 검색기도 추가했다.
- **Homebrew** 더 이상 brew 없는 맥 콘솔은 상상할 수 없다. 각종 도구와 컴파일러등 모든 개발 관련 도구는 brew를 통해 설치한다.
<img src="/images/2017/brew-list.png" width="70%" />
  - 깃헙 토큰 설정 메시지가 나오면 안내 메시지에 따라 `.zshrc`에 추가
- 반면 Cask는 혼란스러워서 사용하지 않는다.
- [Java for OS X 2014-001](https://support.apple.com/kb/DL1572?locale=ko_KR) 설치. Java 6으로 만들어진 앱을 실행하면 설치하겠냐고 자동으로 묻는다. 특히 인터넷 뱅킹앱. 언제까지 Java 6으로 계속 만들건지 ...
  - JDK 최신 버전은 오라클에서 별도로 다운로드하여 설치한다.
- **JetBrains IDE(유료)** [All Products Pack 연간 라이센스를 사용](http://likejazz.com/post/133725850005/jetbrains-all-products-pack)하고 있다. IntelliJ 뿐만 아니라 [CLion](http://likejazz.com/post/118649049333/clion-1-0), WebStorm, PhpStorm, PyCharm, AppCode등을 사용하는 [가장 즐겨쓰는 최고의 IDE](http://likejazz.com/post/112670720955/jetbrains-ide)다.
  - **JetBrains ToolBox** 사용하는 IDE가 많다보니 통합 관리할 수 있어 매우 편하다.
  - IntelliJ의 테마는 Darcula, Editor > General > Editor Tabs > Tab Appearance는 None으로 설정하여 탭은 사용하지 않는다. 대신 Autoscroll from source 설정을 하고 Editor > General > Appearance에서 Show whitespaces와 Show method separators는 활성화 한다.
- **[Android Studio](http://likejazz.com/post/92786243375/%EC%BD%94%EB%93%9C-%ED%95%9C-%EC%A4%84-%EC%97%86%EB%8A%94-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EA%B0%9C%EB%B0%9C-%EC%9D%B4%EC%95%BC%EA%B8%B0)** 설치. IntelliJ에 여러가지 플러그인을 설치하다보면 느려지는 느낌이라 각각의 용도에 적합한 별도의 개발툴을 사용하는 편이다. Go를 위한 IDE로는 **Gogland** 베타 버전을 사용 중
  - Gogland에서 별도로 GOPATH 설정이 가능하나 콘솔에서도 사용하려면 전역 설정을 해주는게 편하다. `~/workspace/go`로 설정. Go 빌드를 위한 glide는 `brew install glide`로 설치
- 코딩을 할때는 항상 JetBrains의 IDE를 사용하지만 리뷰 용도나 간단한 작업시에는 **[Sublime Text 3](http://likejazz.com/post/102824813705/sublime-text)** 를 사용한다. 그러다 [React Native 개발](http://dev.likejazz.com/post/145685053741/react-native)시 Atom + Nuclide를 사용해봤는데 생각외로 만족스러웠다. 이후 코드 편집기로 **Atom** 사용 빈도가 점점 늘고 있다. IntelliJ의 팬이기 때문에 단축키를 intellij-idea-keymap 플러그인으로 동일하게 맞춰 사용한다. vim도 쓰지만 역시 GUI와 마우스를 병행할때 최고의 개발 생산성을 발휘한다.
- dotfiles 설정이 번거로운데 깃헙에 공개 형태로 출판도 해보았으나 여전히 관리하기 번거로움. 새 노트북을 셋팅할때는 gist에 비공개로 만들고 그걸 다시 새 노트북에서 붙여넣기 하는 방법으로 사용했다. 대표적으로 `/etc/paths`, 서브라임 설정/키맵, `/etc/hosts`, `.vimrc` 등.
- 모든 키맵은 IntelliJ를 기준으로 한다. 예전에는 서브라임이 기준이었으나 이제는 간단한 에디터에서도 IntelliJ 키맵을 기본으로 설정한다.
- 사내 시스템에 로그인 하기 위해 커버로스 설정

### 개인 자료
개인 자료의 경우 사진과 비디오는 이미 **Google Photos** 를 적극 활용하고 그외 블로그/기타 이미지 호스팅 용도로 **Flickr** 를 활용한다. 비디오 중 공개적인건 **YouTube** 에, 음악은 따로 다운받지 않고 스트리밍만 사용하고, 문서는 **Dropbox** 와 **iCloud Drive** 에 적절히 나눠 저장하고, MS 오피스 문서는 **OneDrive** 에, 정리가 필요한 문서는 **GitHub Pages** 에 마크다운으로 작성한다. 공개적인 코드는 **GitHub** 에 회사 업무용은 사내 **GitHub Enterprise** 에 둔다. 이제 대부분의 개인 자료는 클라우드에 두다 보니 별도로 백업이나 복원할게 없다.

## 정리하며
도구만 설치하면 각각의 클라우드에서 자료를 온전히 불러올 수 있는 세상이다. 한때 씬 클라이언트<sup>Thin-Client</sup>가 각광을 받았던 적이 있었는데 팻 클라이언트<sup>Fat-Client</sup>의 장점인 고성능<sup>High Performance</sup>, 높은 생산성<sup>High Productivity</sup>, 고가용성<sup>High Availability</sup>의 특징을 결합한 스마트 클라이언트<sup>Smart-Client</sup> 시대가 열리면서 도구만 설치하고 데이타는 클라우드에서 불러들이는 세상이 되었다. 동영상과 같은 특수한 일부 자료만 제외하면 더 이상 데이타는 로컬에 보관하지 않고 있다.
