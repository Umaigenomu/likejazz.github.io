---
layout: wiki 
title: AWS
---

<!-- TOC -->

- [AWS 기반 서버리스 아키텍처 <sub>2017, 2018</sub>](#aws-기반-서버리스-아키텍처-2017-2018)
- [예제를 통해 쉽게 따라하는 아마존 웹 서비스 <sub>2017</sub>](#예제를-통해-쉽게-따라하는-아마존-웹-서비스-2017)

<!-- /TOC -->

# AWS 기반 서버리스 아키텍처 <sub>2017, 2018</sub>
목차:  
아키텍처와 패턴, 서버리스 애플리케이션 구축(S3, SNS), 클라우드 설정(IAM, 로깅, 비용), 인증과 권한, 조율자 Lambda(내부, 프로그래밍 모델, 버전 관리, CLI, 패턴), API Gateway, 스토리지, 데이터베이스

# 예제를 통해 쉽게 따라하는 아마존 웹 서비스 <sub>2017</sub>
목차:  
IAM, S3, VPC - ELB, EC2, RDS, Bridge, Auto Scaling, CloudFront, Route 53, CloudWatch

- IAM에서 User는 Group으로 관리, Role은 OTP기반으로 동작하는 권한이다. 이미 설정된 Managed Policy를 권장하며 AWS에서 미리 정의했다.
- Subnet은 외부 접근이 허용된 Public과 차단된 Private이 있다.
- Elastic IP로 고정 IP를 받을 수 있다. Bastion Host는 gateway의 역할을 한다. - MySQL compatible한 Amazon Aurora DB를 권장한다. 
- ELB는 DNS만 제공. IP가 자주 변경된다. https도 지원한다.