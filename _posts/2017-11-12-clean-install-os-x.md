---
layout: post
title: macOS 설치 프로그램 정리
tags: Productivity
---

<div class="message">
이 글은 원래 요세미티 출시와 함께 맥북에 클린 인스톨을 했던 경험의 기록이다. 그러나, 엘 캐피탄 출시와 함께 업데이트된 내용을 추가했고, 이후 꾸준히 갱신하여 새로운 맥북 프로 터치바에 설치한 기록까지 정리해 본다.
</div>

<small>
*2020년 1월 1일 사용 프로그램 정리*  
*2019년 5월 23일 사용 프로그램 정리*  
*2018년 5월 29일 사용 프로그램 정리*  
*2017년 11월 12일 하이 시에라 설치*  
*2017년 1월 20일 맥북 프로 터치바 셋팅*  
*2016년 6월 22일 최신 내용 반영*  
*2015년 11월 26일 엘 캐피탄 업데이트*  
*2015년 5월 19일 1차 개정*  
*2014년 10월 23일 초안 작성*  
</small>

<!-- TOC -->

- [기본 설정](#기본-설정)
- [인터넷](#인터넷)
- [생산성](#생산성)
- [드라이브](#드라이브)
- [문서](#문서)
- [금융 & 보안](#금융--보안)
- [커뮤니케이션](#커뮤니케이션)
- [멀티미디어](#멀티미디어)
- [콘솔, 개발 도구](#콘솔-개발-도구)
- [자료](#자료)
- [기타](#기타)

<!-- /TOC -->

<img src="https://user-images.githubusercontent.com/1250095/71638614-f7656780-2ca7-11ea-85ce-00c1b7c42369.jpg">

<img src="https://user-images.githubusercontent.com/1250095/58238292-f4a1ac00-7d81-11e9-9762-6cd8b44b6461.jpeg" width="49%" align="left" style="margin-right: 10px"><img src="/images/2017/touchbar.jpg" width="49%">  

<img src="https://c2.staticflickr.com/8/7333/27218763503_715ebb8a06_b.jpg" width="49%" align="left" style="margin-right: 10px"><img src="https://farm8.staticflickr.com/7673/17228888583_65c885c6d5.jpg" width="49%">  

<small>
*2020년 1월 맥북 프로 터치바*   
*2019년 5월 맥북 프로 터치바<sub>중앙 좌</sub>*   
*2017년 1월 맥북 프로 터치바<sub>중앙 우</sub>*  
*2016년 6월<sub>하단 좌</sub>*  
*2015년<sub>하단 우</sub>*
</small>

## 기본 설정
- 키보드 감도는 가장 짧게 조정한다.
- `Caps Lock` 키가 한/영 변환 디폴트가 되었다. 그대로 사용하려 했으나 새끼 손가락이 너무 아프다. 다시 `⌘ + 스페이스`로 변경했다.
- 알림 센터(Notification Center)는 사용하지 않는다. 대시보드도 마찬가지. iOS에만 있어야 할 기능을 억지로 macOS에 배치한 느낌이다.
- 메뉴바 설정에서 배터리 % 표시, 날짜 표시로 변경했다.
- Night Shift를 사용하며, 스케줄은 10:00 PM to 7:00 AM으로 설정했다.
- 터치바 인터페이스는 거의 쓰지 않는다. 나비 키보드와 함께 신형 맥북의 새로운 기능은 모두 실패작이라 생각한다.
- **Bartender 3(유료)** 메뉴바를 정리하는 매우 유용한 앱이다.

## 인터넷
- 메인 브라우저는 **Safari**를 사용한다. 크롬보다 훨씬 더 부드럽게 동작한다.
- 관심 있는 링크는 **Pocket**을 가끔 사용한다.
- ~~더 이상 외부에서 공개 Wi-Fi를 사용할 일은 없지만 신호 세기를 파악하는데 **Wi-Fi Explorer(유료)** 가 유용하다.~~
- 한동안 Firefox와 Firebug는 웹 개발을 위한 최고의 조합이었는데, 이제 하나로 합쳐졌다. **Firefox Developer Edition**를 사용한다.

## 생산성
- 번역 도구로 **Google Translate**를 이용한다. 딥러닝이 적용된 구글 번역의 품질은 매우 훌륭하다. 최근에는 **[카카오 번역기](https://translate.kakao.com/)**를 주로 이용하며, 카톡 친구로 등록하면 훨씬 더 편리하게 이용할 수 있다.
- 버전 관리를 위해 앱은 가능한 앱스토어에서 설치한다. 예전에는 cask를 사용하다 지금은 가끔 **mas**를 이용한다.
- **네이버 캘린더**를 사용하고 있다. 음력 기능 등 한국적인 기능들이 많아서 구글에 비해 편리하다. 최근에는 어쩔 수 없이 사내 캘린더를 사용한다. 다행히 CalDAV를 지원해서 iCal에 연동해서 사용한다.
- **Things(유료)** 2009년에 정품을 구매하여 여전히 사용 중이다. 버전 업데이트를 하면서 추가 비용을 받았는데 기꺼이 구매했다. 아마 맥과 아이폰을 포기하지 못하는 결정적인 이유를 한 가지 대라면 Things를 사용할 수 있기 때문이라고 답할 것 같다.
- **Microsoft To-Do** 10년간 사용해오던 Things를 밀어낸 앱이다. 스타트업의 산뜻한 앱이 아니라 수십년된 오피스 제품군에 포함된 마이크로소프트의 앱이란 점이 새삼 놀랍다. To Do 앱은 사실 누구나 만들 수 있고, 진입 장벽이 낮은 편인데 그간 어떠한 앱도 Things의 독보적인 심플함과 편리함을 넘보지 못했다. 그러나 To-Do는 유일하게 비슷한 수준, 오히려 더 능가하는 수준으로 구현해냈다. 무엇보다 안드로이드를 잘 지원한다는 점이 주효했다. 최근에 폰을 아이폰에서 안드로이드로 변경했고, 더 이상 Things를 사용할 수 없어 매우 불편했는데, To-Do가 빈자리를 채워주고 있다. 물론 메인은 여전히 Things다.
- **Magnet(유료)** Cinch, Divvy를 쓰다가 앱스토어 상위권에 올라와서 구매해 사용 중이다.
- **AppCleaner** Uninstaller가 없는 맥에서는 삭제해도 뭔가 찜찜할때가 많다. 이 앱으로 불필요한 설정까지 찾아서 삭제한다.
- 토렌트 앱은 최근 **Folx**로 변경했다. 윈도우 시절부터 uTorrent를 사용해오다 최근에는 토렌트 자체를 거의 사용하지 않게 됐지만 갈아탔다.
- **VMware Fusion(유료)** 비싼 가격으로 Virtual Box로 이동하려 했으나 기존 이미지 파일을 복구하려면 방법이 없다. 윈도우를 다시 설치할 엄두가 나지 않아 어쩔 수 없이 계속 사용하고 있다. 이미 이미지 파일 크기가 57G에 달하며, 현재 8.5.3 버전을 사용하고 있다.
  - **Parallels(유료)** 회사 업무용으로 패러럴즈를 택해서 지급 중이라 사용 중이다. 좀 더 편리한 기능이 돋보이지만 VMWare와 비교해 성능상에 큰 차이는 없는 것 같다.
- **Daum Equation Editor** 더 이상 업데이트는 되지 않고 있지만 LaTex 수식을 편집할때 이만한게 없다. 여전히 잘 사용 중이다.

## 드라이브
- **Dropbox** 경쟁 서비스가 많지만 여전히 최고의 클라우드 서비스다. 
  - `~/bin` 콘솔에서 컴맨드로 처리해야할 명령은 이 디렉토리에 두고 Dropbox에 동기화 한다.
- **iCloud Drive**도 사용한다. 무엇보다 최신 앱들이 iCloud Drive 저장 기능을 제공한다. 하지만 문서 저장 용도와 Find My Mac을 제외한 다른 iCloud 기능은 불필요하게 번거로워 사용하지 않는다.
- **Microsoft OneDrive**는 오피스를 위한 전용 저장소로 활용한다.
- 오랫동안 **Google Drive**를 사용해왔다. 무엇보다 그동안의 기록이 남아 있고 어디서든 확인하고 편집할 수 있는 점은 가장 큰 장점이다.

## 문서
- 이 문서를 호스팅하는 공간은 **GitHub Pages**다. 수년간 최고의 지식 저장소로 활용하고 있으며, **MathJax**를 이용한 수식 지원도 좋다. 깃헙 위키의 경우 수식을 입력할 수 있는 방법이 마땅찮아 모두 깃헙 페이지로 이관했다.
- **Microsoft Office(유료)**는 맥에서도 최고의 업무용 도구다.
- 오랫동안 **Evernote**를 사용해왔다. 그 동안의 기록들은 이제 히스토리 아카이빙의 역할을 하고 있다. 구글 드라이브 또한 비슷한 용도로 활용중이다.
  - ~~**Microsoft OneNote**는 아이패드와 애플 펜슬을 업무에 활용하는 가장 멋진 방법이다. 직접 노트에 필기하는 것 이상으로 편리하며 무엇보다 아이패드와 데스크탑 간에 실시간 동기화가 매력적이다. 독서를 할때도 아이패드와 애플 펜슬, 원노트를 이용해 독서록을 적어나가는데, 더 이상 몰스킨을 꺼내들 필요가 없다.~~ 아이패드에서는 **GoodNotes(유료)**와 **Flexcil(유료)**을 활용하고 있다.
- 프리젠테이션을 위해 KeyNote 부터 Deckset등 여러 앱을 오갔지만 결국 마지막 종착역은 다시 **Microsoft PowerPoint(유료)** 였다.
- ~~**Papers(유료)** 논문 관리 도구로 각종 PDF를 보관하고 관리하는데 유용하다. 사진은 이미 Google Photos로 완전히 옮겨갔으나 PDF는 사이즈가 크다 보니 로컬에서 라이브러리를 관리하는 몇 안되는 도구 중 하나다. 너무 느리고 비싼게 단점으로, 만약 버전업되면서 추가 비용을 받는다면 다시 구매할 생각은 없다.~~

## 금융 & 보안
- 별도의 안티 바이러스 프로그램을 사용하지 않는 대신 **Little Snitch(유료)**를 사용한다. 네트워크 접속을 제한적으로 차단하는 앱인데, 프로세스, 도메인, 네트워크 위치등을 직관적으로 나열해주고 선택적으로 접속할 수 있게 한다. 내 경우 불필요한 클라우드 서비스와 버전 업데이트 등은 모두 차단하도록 설정한다. 벌써 메이저 4버전 까지 나왔는데, 메이저 버전 업그레이드는 매 번 추가 비용을 따로 받는다. 얼마전 블랙 프라이데이 세일때 4버전을 50% 할인 가격으로 구매했다.
- **1Password(유료)** SuperGenPass를 이용하다 비밀번호 자동 생성 만으로는 부족함이 있어 1Password를 구매해 사용 중이다. 서비스 별로 ID가 다른 경우도 있고 주기적으로 비밀번호를 다르게 바꿔야 할 때도 있는데 기억할 필요가 없어 매우 편리하며, Dropbox에 싱크해 사용 중이다. 7 버전이 나오면서 서브스크립션 모델로 변경되었는데, read-only로 사용한다면 추가 구매 없이 계속 사용이 가능하다. 마음 같아선 서브스크립션 해주고 싶지만 이미 무료로 잘 사용 중이라 추가/삭제는 아이패드에서 하고 맥에서는 계속 read-only로 사용한다.

## 커뮤니케이션
- **카카오톡** 메신저는 개인 용도 뿐만 아니라 업무용으로도 훌륭한 커뮤니케이션 수단이다.
- **Slack** 업무용 메신저로 활용한다.

## 멀티미디어
- **Xee<sup>3</sup>(유료)** 빠른 속도 뿐만 아니라 편리한 브라우징이 돋보이는 최고의 이미지 뷰어다. 권한 때문에 파일 브라우징이 다소 불편하게 됐다.
- 간단한 이미지 편집은 기본 앱인 **Preview**를 사용하고 있다.
- **IINA** Swift로 만든 터치바도 지원하는 동영상 플레이어. 중국 개발자가 만들었으며 무척 깔끔하다.
- ~~**Air Video Server HD(유료)** 동영상을 맥에서 아이패드로 스트리밍 할 수 있는 앱이다. 맥 스트리밍 서버를 설치해야 한다.~~
- **왓챠 플레이(유료)**를 구독한다. 주로 아이패드에서 영화를 본다.

## 콘솔, 개발 도구
- **iTerm2** 최고의 터미널 프로그램이다.
- **Xcode**를 거의 사용하진 않지만 LLVM을 비롯한 각종 개발 도구를 최신 버전으로 업데이트 하기 위해 필수적으로 설치한다.
- 개발 관련 프로젝트는 `~/workspace` 디렉토리를 만들어 저장한다. 디렉토리 구조는 깃헙 URL 기준으로 만들어 관리하고 있다.
- 유료 git 클라이언트를 사용하다가 최근에는 깃헙에서 공식 배포하는 **GitHub Desktop**을 사용한다. 무료이면서도 매우 직관적이고 diff를 보기 편하게 보여준다.
- 어느덧 zsh 기반의 **oh my zsh** 가 대세가 됐다. 서버와 동일한 환경을 유지해야 한다는 생각에 계속 bash를 사용해왔으나 이제 서버에 직접 접속해서 작업할 일은 많지 않고 또한 그간 무거워서 사용하지 않았으나 최근 플러그인 구조도 많이 가벼워지고 fish의 도무지 적응 안되는 문법으로 인해 다시 zsh 기반으로 이전했다.
  - **fasd** 는 `brew install fasd`로 별도 설치. 아래 `.zshrc`의 `plugins` 설정에 fasd를 추가하면 편리한 aliases를 사용할 수 있다.
  - **ag**와 **fzf**도 꼭 필요한 텍스트 검색 도구다. `brew install the_silver_searcher` fzf는 `CTRL-R`을 포함한 키 바인딩과 추가 맵핑을 함께 설치했다. `brew install fzf` 이후 환경 설치. 사실상 모든 검색 인터페이스는 fzf로 통일했다.
  - 플러그인은 `plugins=(git history python fasd history-substring-search docker)`를 사용한다.
- **Homebrew** 이제 brew 없는 맥 콘솔은 상상할 수 없다. 각종 도구와 컴파일러등 모든 개발 관련 도구는 brew를 통해 설치한다.
<img width="70%" src="https://user-images.githubusercontent.com/1250095/32696328-ea701530-c7b8-11e7-9501-149a4ce0dd86.png">  
  - `Brewfile`은 아래와 같다.  
```
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "wallix/awless"
brew "cmake"
brew "fasd"
brew "fzf"
brew "git"
brew "gnu-tar"
brew "go"
brew "htop"
brew "python"
brew "httpie"
brew "jq"
brew "m-cli"
brew "mas"
brew "nmap"
brew "node"
brew "speedtest-cli"
brew "telnet"
brew "the_silver_searcher"
brew "tree"
brew "watch"
brew "wget"
brew "wallix/awless/awless", link: false
cask "anaconda"
mas "Daum Equation Editor", id: 540665783
mas "Evernote", id: 406056744
mas "Hancom Office HWP 2014 VP Viewer", id: 416746898
mas "KakaoTalk", id: 869223134
mas "Keynote", id: 409183694
mas "Magnet", id: 441258766
mas "Microsoft OneNote", id: 784801555
mas "Microsoft Outlook", id: 985367838
mas "Microsoft Remote Desktop", id: 1295203466
mas "Microsoft To-Do", id: 1274495053
mas "Slack", id: 803453959
mas "Wake Up Time", id: 495945638
mas "Xcode", id: 497799835
mas "Xee³", id: 639764244
```
- **JetBrains IDE(유료)** [All Products Pack 연간 라이센스를 사용](http://likejazz.com/post/133725850005/jetbrains-all-products-pack)하고 있다. IntelliJ 뿐만 아니라 [CLion](http://likejazz.com/post/118649049333/clion-1-0), PyCharm, PhpStorm, AppCode, GoLand등을 사용하는 [가장 즐겨쓰는 최고의 IDE](http://likejazz.com/post/112670720955/jetbrains-ide)다.
  - **JetBrains ToolBox** 제트브레인의 IDE를 통합 관리할 수 있는 메뉴바 앱이다. `Update all tools automatically`로 설정하고 사용한다.
  - IntelliJ의 테마는 Darcula를 사용한다. `Editor > General > Appearance`에서 **Show whitespaces**와 **Show method separators**는 활성화 한다.
  - IntelliJ의 **Identifier under caret** 기능을 유용하게 사용하는 편이라 기본 Darcula에서 이 색상만 Background를 `FFFF00`로 지정, `Identifier under caret (write)`는 `FFFFE0`로 지정하고 눈에 띄게 사용하다.
- **Visual Studio Code**의 Extensions는 아래와 같이 사용한다.
  - **IntelliJ IDEA Keybindings** 앞서 언급한 단축키를 맞추기 위한 필수 익스텐션
  - 마크다운을 깃헙 위키 스타일로 미리 보기 위한 **Markdown Preview Enhanced**.
  - 마크다운 TOC 생성을  위한 **Markdown TOC**.
- 주로 업무와 관련한 프로젝트 개발을 할때는 항상 JetBrains의 IDE를 사용하지만 문서를 작성하거나 간단한 코드에는 여전히 **[Sublime Text 3](http://likejazz.com/post/102824813705/sublime-text)**를 사용하다 최근에는 **Visual Studio Code**를 주로 사용한다. Atom보다 빠르고 플러그인 지원도 훌륭해서 문서 편집 용도로도 최적이다. vim도 사용하지만 역시 GUI와 마우스를 병행할때 최고의 생산성을 발휘한다.
- dotfiles 설정은 번거롭다. 깃헙에 공개 형태로 출판도 해보았으나 여전히 관리하기가 쉽지 않다. 새 노트북을 셋팅할때 Dropbox에 보관했다가 셋팅했다. `/etc/hosts`, `.vimrc`, `.zshrc` 등등.
- 모든 키맵은 IntelliJ를 기준으로 한다. 예전에는 Sublime이 기준이었으나 이제는 간단한 에디터에서도 IntelliJ 키맵으로 맞추는 플러그인을 항상 기본으로 설치한다.
- **Docker** 개발/테스트/서비스로 이어지는 설정과 설치는 항상 고민거리다. 도커는 그 고민을 말끔하게 해결해줬다. 사실상 OS까지 함께 설치하는 컨테이너 개념은 정말 편하다. 게다가 맥에서도 작년부터 native hypervisor를 지원해서 virtualbox를 사용해야 하는 불편함도 말끔히 해결됐다.

## 자료
개인 자료의 경우 사진과 비디오는 **Google Photos**를 활용하고 그외 블로그와 기타 이미지 호스팅 용도로 **GitHub**의 Issues를 활용한다. 비디오 중 공개적인건 **YouTube**에, 음악은 **YouTube** 스트리밍을 사용하고, 문서는 **Dropbox**와 **iCloud Drive**에 적절히 나눠 저장하고, 오피스 문서는 **OneDrive**에, 정리가 필요한 문서는 **GitHub** 위키에 마크다운으로 작성한다. 공개적인 코드는 공개 **GitHub**에, 회사 업무용은 사내 **GitHub Enterprise**에 둔다.

## 기타
대부분의 개인 자료는 클라우드에 두다 보니 맥북을 새로 구매하거나 클린 인스톨을 진행해도 별도로 백업이나 복원할게 없다. 동영상 처럼 용량이 매우 큰 일부 자료나 여러가지 아카이빙을 제외하면 더 이상 로컬에 데이터를 보관할 필요가 없다. 언젠가는 아카이빙도 모두 온라인으로 하게 될지도 모르겠다.