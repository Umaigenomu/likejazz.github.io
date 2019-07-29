---
layout: wiki 
title: AWS
---

<!-- TOC -->


<!-- /TOC -->

IAM, S3, VPC - ELB, EC2, RDS, Bridge, Auto Scaling, CloudFront, Route 53, CloudWatch  
(예제를 통해 쉽게 따라하는 아마존 웹 서비스, 2017)

- IAM에서 User는 Group으로 관리, Role은 OTP기반으로 동작하는 권한이다. 이미 설정된 Managed Policy를 권장하며 AWS에서 미리 정의했다.
- Subnet은 외부 접근이 허용된 Public과 차단된 Private이 있다.
- Elastic IP로 고정 IP를 받을 수 있다. Bastion Host는 gateway의 역할을 한다. 
- MySQL compatible한 Amazon Aurora DB를 권장한다. 
- ELB는 DNS만 제공. IP가 자주 변경된다. https도 지원한다.

(서비스 운영이 쉬워지는 AWS 인프라 구축 가이드, 2019)와 비슷한 내용

# 그림으로 배우는 클라우드 인프라와 API의 구조 <sub>2016, 2017</sub>
기존의 AWS 책들과 달리 사용법이 아닌 인프라 설계의 관점에서 OpenStack과 비교를 통해 하나씩 설명한다. 튜토리얼 아닌 구조에 대한 설명 중심으로 소개한다.

- 클라우드를 제어하는 API의 동작 방식  
FQDN Fully Qualified Domain Name: 도메인과 호스트명이 하나로 연결된 전체 이름.  
ROA Resource Oriented Architecture, 리소스 지향 아키텍처란 REST API의 사상을 기반으로 리소스 중심적인 API를 사용하는 아키텍처를 말한다. REST는 프로토콜이 아니라 일종의 사상이나 접근 방식에 가깝다. DeveloperWorks에 올라온 RESTful Web services에서는 아래 4가지 설계 지침을 언급한다.
1. 상태를 갖지 않도록 만든다.
1. URI는 디렉터리 구조처럼 계층적으로 만든다.
1. HTTP 메모들을 명시적으로 사용한다.
1. 응답할 때는 XML이나 JSON을 사용한다(둘 다 사용해도 무방).  
멱등성: 입력값이 동일하면 항상 같은 결과를 보장한다. Functional programming에서 철학과 유사해 보인다.
- 오케스트레이션.  
대표적인 도구로 Ansible. 소프트웨어 개발의 자동화를 위해 테스트를 만드는 작업에 해당. 
- 멀티 클라우드.  
특이하게도 멀티 클라우드를 적용하는 방법에 대해 소개. 컨테이너가 주목받는 이유는 OS와의 의존성을 끊어줌으로써 클라우드 간의 이행을 더 쉽게 만들어주기 때문 p.414
- 이뮤터블 인프라스트럭처
기존 시스템은 하드웨어, 소프트웨어의 유지보수와 업그레이드, 관리와 운영이 지속적으로 필요하다.

그러나, 이뮤터블 인프라스트럭처는 인프라 환경을 자동으로 구축하고, 시스템을 변경해야 할 때는 이미 구축된 환경을 수정하는 대신, 구축된 환경을 파괴하고 수정된 환경으로 다시 구축하라.

시스템 구축을 자동화 하는 방법으로는 ansible을 활용하기도 하는데, AWS의 CloudFormation도 이에 해당.