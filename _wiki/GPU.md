---
layout: wiki 
title: GPU
---

<!-- TOC -->

- [가격](#가격)
    - [AWS](#aws)
    - [Azure](#azure)
    - [Google Cloud](#google-cloud)
    - [NVIDIA](#nvidia)
- [Low Precision Inference on GPU](#low-precision-inference-on-gpu)

<!-- /TOC -->

# 가격
## AWS

| Type | On Demand | RI(3yrs) |
| ---- | ------------- | -------- |
| P3/V100 | $4.234 | $1.676(60%) |
| P2/K80 | $1.460 | $0.679(54%) |
| G3/M60 | $1.420 | $0.685(52%) |

## Azure
V100 4ea x 3yrs = 171,651,472 KRW  
1 hour = 1,632 KRW

## Google Cloud

| Region | Type | On Demand | Preemptible | 1yr | 3yrs |
| ------ | ---- | --------- | ----------- | --- | ---- |
| 도쿄(asia-northeast1) | T4 | $1.03 | $0.31 | $0.65 | $0.47 |
| 타이완(asia-east1) | V100 | $2.48 | $0.74 | $1.562 | $1.116 |
| 타이완(asia-east1) | P100 | $1.60 | $0.43 | $1.008 | $0.720 |
| 타이완(asia-east1) | K80 | $0.49 | $0.135 | $0.308 | N/A |

한 달 내내 사용한 GPU 1개의 사용 비용에 대해 30% 할인을 받습니다.  
K80 월 비용은 $224.840 이다.

## NVIDIA

**M60, M6**  
엔터프라이즈에서 사용하는 서버용 모델입니다. M60은 랙 타입 서버에 탑재되고, M6는 블레이드 서버에 장착됩니다. M60은 4,096개의 CUDA 코어를 제공하며, 16GB의 GDDR5 메모리가 제공됩니다. M6는 1,536 CUDA 코어, 8GB GDDR5 메모리를 주요 사양으로 합니다. [^fn-1]

[^fn-1]: <https://www.udna.kr/tesla?gclid=Cj0KCQjw5MLrBRClARIsAPG0WGx1nHcumfgpb3FMT-4OcMA2V6S-gQNL9GT4EzAjyUvoEEqdk6L8GJsaAhchEALw_wcB>

**K40, K80**  
고성능 병렬 처리를 위한 카드로 각각 4,992/2,880 CUDA 코어를 제공합니다. 

**P40, P4**  
인퍼런스(Inference)에 특화된 카드로 각각 3,584/1,024 CUDA 코어를 제공합니다.

**P100**  
딥러닝을 위한 제품으로 Mazzanine과 PCI-Express 모델로 구분되며 3,584개의 CUDA 코어를 제공합니다.

**T4**  
차세대 인퍼런스 가속을 위해 특별히 개발되었습니다. The World's Most Advanced Inference Accelerator. NVIDIA Turing Tensor Core를 기반으로 AI 인퍼런스 속도를 CPU 대비 40배 이상 빠른 속도로 가속합니다. 

# Low Precision Inference on GPU
<img src="https://user-images.githubusercontent.com/1250095/64407402-2e8f8780-d0bf-11e9-8eb9-ff3aa8ceb348.jpg" width="80%">

T4 GPU에서 Quantized 연산으로 8.1TFLOPS를 130 TOPS, 16배 개선할 수 있다. 그러나, BERT SQuAD 1.1(F1) 점수가 Int8에서 6.43%나 낮다. Activation으로 GeLU10을 사용해 0.67% 이내로 줄일 수 있다. ([발표 자료 PDF](https://developer.download.nvidia.com/video/gputechconf/gtc/2019/presentation/s9659-inference-at-reduced-precision-on-gpus.pdf) 참고)

<img src="https://user-images.githubusercontent.com/1250095/64407574-9c3bb380-d0bf-11e9-908c-83783fcb6692.jpg" width="80%">