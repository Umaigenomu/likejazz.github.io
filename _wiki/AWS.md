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