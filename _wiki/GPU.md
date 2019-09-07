---
layout: wiki 
title: GPU
---

<!-- TOC -->

- [가격](#가격)
    - [AWS](#aws)
    - [Azure](#azure)
    - [Google Cloud](#google-cloud)
    - [Best Deals in Deep Learning Cloud Providers](#best-deals-in-deep-learning-cloud-providers)
- [NVIDIA](#nvidia)
- [Low Precision Inference on GPU](#low-precision-inference-on-gpu)
- [NumPy GPU acceleration](#numpy-gpu-acceleration)
- [CUDA](#cuda)

<!-- /TOC -->

# 가격
## AWS

| Type | On Demand | RI(3yrs) |
| ---- | ------------- | -------- |
| P3/V100 | $4.234 | $1.676(60%) |
| G3/M60 | $1.420 | $0.685(52%) |
| P2/K80 | $1.460 | $0.679(54%) |

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
| Oregon(us-west1) | K80 | | | $206.590 (monthly)<br>$0.198 (effective hourly rate) | |

- A 30% discount off the cost of using 1 GPU for a full month  
- K80 가격(타이완, 한 달 정가): $224.840 272,250 KRW
- 최저가(Oregon, 월 30% 할인 적용): $144.613 172,740 KRW

## Best Deals in Deep Learning Cloud Providers
<img src="https://miro.medium.com/max/2696/1*ooV7tfwd5sJeSazuMGYYJg.png" width="80%">[^fn-deal]

[^fn-deal]: <https://towardsdatascience.com/maximize-your-gpu-dollars-a9133f4e546a>

# NVIDIA

GPGPU 제품군인 NVIDIA Tesla 칩셋 정리[^fn-tesla]  

NVIDIA Quadro cards are designed for accelerating CAD. Tesla cards are designed for scientific computations. Nvidia RTX is a graphics rendering development platform created by Nvidia.

**T4**  
Turing  
- PCIe: 2560 * 585/1590 MHz, 8100 GFLOS, 16G (Sep 2018)

차세대 인퍼런스 가속을 위해 특별히 개발되었습니다. The World's Most Advanced Inference Accelerator. NVIDIA Turing Tensor Core를 기반으로 AI 인퍼런스 속도를 CPU 대비 40배 이상 빠른 속도로 가속합니다. 

**V100**  
Volta
- mezzanine(NVLink): 5120 * ?/1455 MHz, 14899 GFLOPS, 16G or 32G (Jun 2017)

**P100**  
- mezzanine(NVLink): 3584 * 1328/1480 MHz, 9519–10609 GFLOPS, 16G (Apr 2016)

딥러닝을 위한 제품으로 Mezzanine과 PCI-Express 모델로 구분되며 3,584개의 CUDA 코어를 제공합니다.

**P40, P4**  
Pascal  
- P40: 3840 * 1303/1531 MHz, 10007–11758 GFLOPS, 24G (Sep 2016)
- P4: 2560 * 810/1063 MHz, 4147–5443 GFLOPS, 8G (Sep 2016)

인퍼런스(Inference)에 특화된 카드로 각각 3,584/1,024 CUDA 코어를 제공합니다.

**M60, M6**  
Maxwell  
- M60: 4096 * 899/1178 MHz, 7365–9650 GFLOPS, 2x8G (Aug 2015)
- M6: 1536 * 722/1051 MHz, 2218–3229 GFLOPS, 8G (Aug 2015)

엔터프라이즈에서 사용하는 서버용 모델입니다. M60은 랙 타입 서버에 탑재되고, M6는 블레이드 서버에 장착됩니다. M60은 4,096개의 CUDA 코어를 제공하며, 16GB의 GDDR5 메모리가 제공됩니다. M6는 1,536 CUDA 코어, 8GB GDDR5 메모리를 주요 사양으로 합니다. [^fn-1]

**K40, K80**  
Kepler  
- K80: 4992 * 560/875 MHz, 5591–8736 GFLOPS, 2x12G (Nov 2014)
- K40: 2880 * 745/875 MHz, 4291–5040 GFLOPS, 12G (Oct 2013)

[^fn-1]: <https://www.udna.kr/tesla?gclid=Cj0KCQjw5MLrBRClARIsAPG0WGx1nHcumfgpb3FMT-4OcMA2V6S-gQNL9GT4EzAjyUvoEEqdk6L8GJsaAhchEALw_wcB>
[^fn-tesla]: <https://en.wikipedia.org/wiki/Nvidia_Tesla>

# Low Precision Inference on GPU
<img src="https://user-images.githubusercontent.com/1250095/64407402-2e8f8780-d0bf-11e9-8eb9-ff3aa8ceb348.jpg" width="80%">

T4 GPU에서 Quantized 연산으로 8.1TFLOPS를 130 TOPS, 16배 개선할 수 있다. 그러나, BERT SQuAD 1.1(F1) 점수가 Int8에서 6.43%나 낮다. Activation으로 GeLU10을 사용해 0.67% 이내로 줄일 수 있다. ([발표 자료 PDF](https://developer.download.nvidia.com/video/gputechconf/gtc/2019/presentation/s9659-inference-at-reduced-precision-on-gpus.pdf) 참고) MRPC는 유사 문장 판별 태스크 이다.

<img src="https://user-images.githubusercontent.com/1250095/64407574-9c3bb380-d0bf-11e9-908c-83783fcb6692.jpg" width="80%">

# NumPy GPU acceleration
[^fn-numpy]  
- CuPy, which has a NumPy interface for arrays allocated on the GPU used in Chainer.
- Numba is an JIT compiler using the industry-standard LLVM compiler library that translates a subset of Python and NumPy code into fast machine code.
- PyCUDA lets you access Nvidia's CUDA parallel computation API from Python. 
- PyTorch as you know very well.
- JAX can automatically differentiate native Python and NumPy functions with updated version of Autograd.

[^fn-numpy]: <https://stsievert.com/blog/2016/07/01/numpy-gpu/>

# CUDA
<img src="https://www.nvidia.com/content/dam/en-zz/Solutions/technologies/cuda-x/cuda-x-ai-ecosystem-diagram-1ccw-l.png">