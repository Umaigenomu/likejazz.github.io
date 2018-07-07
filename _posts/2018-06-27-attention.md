---
layout: post
title: Attention Mechanism 정리
tags: [Deep Learning for NLP]
invisible: true
---

<div class="message">
..
</div>

<small>
*2018년 6월 27일 초안 작성*  
</small>

<!-- TOC -->

- [본문](#본문)
    - [Attention LSTM](#attention-lstm)
    - [Addition](#addition)
    - [Attention](#attention)
    - [Stacked LSTM](#stacked-lstm)
    - [Attention LSTM](#attention-lstm-1)
    - [Seq2Seq with Attention](#seq2seq-with-attention)
    - [기타](#기타)
    - [코드](#코드)
- [References](#references)

<!-- /TOC -->

https://mchromiak.github.io/articles/2017/Sep/12/Transformer-Attention-is-all-you-need/#.WzMk-RIzYmp
http://www.wildml.com/2016/01/attention-and-memory-in-deep-learning-and-nlp/

한글 http://dalpo0814.tistory.com/45
http://freesearch.pe.kr/archives/4724 딥러닝이 덧셈을 하는 법

## 본문
그러나 잠재적으로 매우 긴 문장에 대한 모든 정보를 단일 벡터로 인코딩 한 다음 디코더가이를 기반으로 훌륭한 변환을 생성 할 수 있다고 가정하는 것은 다소 무리가 있습니다. 원본 문장의 길이가 50 단어라고 가정 해 봅시다. 영어 번역의 첫 번째 단어는 원본 문장의 첫 단어와 관련성이 높습니다. 그러나 이것은 디코더가 50 단계 전의 정보를 고려해야한다는 것을 의미하며 그 정보는 어떻게 든 벡터에 인코딩되어야합니다. 반복적 인 신경 회로망은 그러한 장거리 의존성을 다루는데 문제가있는 것으로 알려져있다. 이론 상으로는 LSTM 과 같은 아키텍처이 문제를 처리 할 수 ​​있어야하지만 실제로는 장거리 종속성이 여전히 문제가됩니다. 예를 들어, 소스 시퀀스를 뒤집어서 (인코더로 역방향으로 공급하는) 디코더에서 인코더의 관련 부분까지의 경로를 단축하므로 훨씬 더 나은 결과를 산출한다는 것을 연구원은 발견했습니다. 마찬가지로 입력 시퀀스를 두 번 먹이면 네트워크가 더 잘 암기하는 데 도움이되는 것처럼 보입니다.
..

RNN으로 시퀀스 정보를 압축할때 long-range dependencies 문제가 있다. LSTM은 게이트 구조를 통해 이 문제를 잘 해결하는 것으로 알려져 있지만 실제로는 여전히 문제가 존재한다. 문장이 길수록 많은 정보가 압축되어야 하고 LSTM의 레이어 수를 늘리는 방법은, 긴 문장의 경우 보다 많은 레이어가 필요하고 이는 네트워크의 비대를 가져온다.

http://www.wildml.com/2016/01/attention-and-memory-in-deep-learning-and-nlp/

입력값을 뒤집어 디코더에서 인코더 까지의 경로를 줄이는 방법으로 성능 향상을 가져오기도 한다. 마찬가지로 입력 시퀀스를 두 번씩 처리하면 네트워크가 더 잘 기억<sup>memorize</sup>하는데 도움이 된다.

https://arxiv.org/abs/1410.4615 Learning to Execute

So, what’s an alternative? Attention Mechanisms.

https://datascience.stackexchange.com/questions/18402/why-does-lstm-performs-better-when-the-source-target-is-reversed-seq2seq
입력값이 반전일때 성능이 왜 더 좋나는 질문
일반적으로 원본 문장과 대상 문장을 연결하면 원본 문장의 각 단어가 대상 문장의 해당 단어와 멀리 떨어져 있습니다.

Thus, backpropagation has an easier time “establishing communication” between the source sentence and the target sentence, which in turn results in substantially improved overall performance.

### Attention LSTM

### Addition
이전 글에서 실험한 Addition 예제를 SimpleSeq2Seq(기존 방식)과 논문의 Seq2Seq(논문대로(참고 논문 표기) h, c를 다음 시퀀스에 입력값으로 하는), AttentionSeq2Seq(Seq2Seq에 Attention 적용) 세가지 방식으로 학습 성능을 비교한 결과는 아래와 같다.


AttentionSeq2Seq 적용 결과 addition rnn이 훨씬 학습이 더 잘된다. 이미 epoch이 30이 되기 전에 0.98 이상을 찍었다. 기존 SimpleSeq2Seq가 50 epochs를 다 돌아도 0.98을 채우지 못한 것과는 대조적이다.

같은 코드는 addition_seq2seq.py로 작성했다.

### Attention
어텐션으로 인해 더 이상 고정 길이 벡터로 전체 입력 문장을 인코딩 하지 않는다.

### Stacked LSTM
https://arxiv.org/abs/1303.5778

같은 연구에서, 그들은 네트워크의 깊이가 모델 기술에 주어진 레이어에서 메모리 셀의 수보다 더 중요하다는 것을 발견했다.

Stacekd LSTM은 이제 시퀀스 예측 문제에 대한 안정적인 기술입니다. 스택 형 LSTM 아키텍처는 여러 LSTM 레이어로 구성된 LSTM 모델로 정의 할 수 있습니다. 위의 LSTM 레이어는 아래의 LSTM 레이어에 단일 값 출력이 아닌 시퀀스 출력을 제공합니다. 특히 모든 입력 시간 단계에 대해 하나의 출력 시간 단계가 아니라 입력 시간 단계 당 하나의 출력.

### Attention LSTM
LSTM에 어텐션을 아래와 같은 형태로 적용할 수 있다.

다만, Dense에 사용하거나 LSTM 이전에 Attention을 적용하는건 이해가 명확한 것과 달리 LSTM 이후 적용은 해석하기가 쉽지 않다. 분명 15번 레이어에만 적용했음에도 불구하고 16번이 덩달아 함께 따라간걸 확인할 수 있다. 

`SINGLE_ATTENTION_VECTOR = True`를 적용하면 softmax 결과를 차원 축소 후 `RepeatVector`로 늘려서 적용하고, 이는 어텐션 벡터가 인풋 디멘젼 전체에 공유되는 효과를 줄 수 있다. 아래에서 15번 레이어에 어텐션 메커니즘이 더 잘 적용 됐음을 확인할 수 있다.

### Seq2Seq with Attention
```
pip install git+https://github.com/farizrahman4u/seq2seq.git
```

Recurrent Shop 설치가 필요한데, 이 사람이 직접 만든 버전은 오류가 나는 버그가 있다. 이를 https://github.com/kklemon/recurrentshop 에서 fork 하여 패치했고, 이 버전을 설치하면 잘 동작한다.

--

_output 이상한 버그 재현 후 정리

여기서는 패치한 코드를 fork 한 //github.com/kklemon/recurrentshop.git를 받아서 직접 빌드한다.
이는 RNN의 state를 다음 레이어의 init 값으로 적용하는 기능을 포함하는 custom layer다.


### 기타
주의는 단순히 벡터이며, softmax 기능을 사용하는 밀집 층의 출력입니다.

이미지를 작성할 때 수 개의 단어로 표현 된 수백 개의 문장은 반드시 정보 손실, 부적절한 번역 등을 초래합니다.

주의는 신비하거나 복잡하지 않다. 매개 변수와 섬세한 수학으로 공식화 된 인터페이스 일뿐입니다. 당신은 그것을 적당한 곳 어디에서나 연결할 수 있으며 잠재적으로 그 결과가 향상 될 수 있습니다.
https://medium.com/syncedreview/a-brief-overview-of-attention-mechanism-13c578ba9129

--

벡터가 디코더가 취할 수있는 유일한 정보이므로 디코더가 전체 출력을 생성 할 수있는 충분한 정보를 유지해야합니다. 이렇게하면 긴 이름이나 단어를 생성 할 때 벡터에 정보 병목 현상이 발생합니다.

전체 문장을 읽고, 하나의 "생각"으로 모든 것을 기억하고, 다시 엿보기하지 않고 번역 된 문장을 쓰는 것이 더 어렵습니다. 문장이 길수록 원래 문장의 모든 세부 사항을 기억하는 것이 어려워집니다. 비록 당신이 좋은 기억을 가지고 있다고해도, 전체 단락이나 전체 페이지를 한 번의 읽기로 번역해야한다면 무엇을 이미징 할 것인지.

https://wanasit.github.io/attention-based-sequence-to-sequence-in-keras.html

### 코드
- 같은 코드는 addition_seq2seq.py로 작성했다.
- attention_lstm.py

## References
