---
layout: wiki 
title: Sent2Vec
---

<!-- TOC -->

- [논문](#논문)
- [fastText 구현](#fasttext-구현)
    - [공통](#공통)
    - [CBOW](#cbow)
    - [skipgram](#skipgram)
    - [Sent2Vec](#sent2vec)
        - [word n-grams](#word-n-grams)

<!-- /TOC -->

# 논문
- [Unsupervised Learning of Sentence Embeddings using Compositional n-Gram Features](https://arxiv.org/abs/1703.02507)  
- [문장 임베딩 Sent2Vec과 fastText 구현](http://docs.likejazz.com/sent2vec/)

**Shallow sentence embedding model.** The window is a full semantic unit (sentence, paragraph, document ...) instead of a few consequtive words words.[1]

[1]: http://ad-publications.informatik.uni-freiburg.de/theses/Bachelor_Jon_Ezeiza_2017_presentation.pdf

# fastText 구현
## 공통
- `saveOutout()`과 `saveVector()`의 차이가 궁금하다. 함수를 수정하여 둘 다 동일한 값이 나오도록 패치했다. `saveVector()`를 기준으로 했으며 이 값이 fasttext 콘솔에서 실행했을때와 동일한 결과다. vector는 gensim에서 `load_word2vec_format()`으로 읽을 수 있다.
- 버그가 좀 있다. fasttext 자체의 버그도 있고, sent2vec을 적용하면서 생긴 버그도 있다. 정체 불명의 값을 저장하는 `saveOutput()` 버그를 패치했는데, upstream 코드 확인이 필요하다. fasttext 또한 upstream 기준으로 최신 반영이 필요해 보인다.

## CBOW
- 원래 cbow는 context의 mean을 입력으로 한 번만 계산하는 것으로 알고 있는데 fasttext 구현은 `[input]` 벡터가 들어가서 각각의 grad를 계산하는 것으로 보인다. 즉, ngram을 쓰지 않는 경우 skipgram과 차이가 없어 보인다. ~~그러나 ngram을 쓴다면 모든 ngram이 context를 대상으로 계산하게 되므로 skipgram의 계산량은 훨씬 더 증가한다.~~
![](https://fasttext.cc/img/cbo_vs_skipgram.png)
<https://fasttext.cc/docs/en/unsupervised-tutorial.html>
- fastText 문서에도 sum으로 처리한다고 되어 있다.

## skipgram
- `line[w]`가 target이다. 여기서는 context가 된다. boundary는 cbow와 마찬가지로 최대 윈도우 사이즈 내에서 랜덤하게 지정된다. seed가 따로 정의되지 않았기 때문에 학습마다 매 번 동일한 랜덤 값이 부여된다.

## Sent2Vec
- `getNgrams()`는 cbow, skipgram을 위한 char ngram 함수이고 `addNgrams()`는 sent2vec을 위한 토큰 ngram 생성 함수다.
- negative sampling에서 unsupervised는 label이 존재하지 않을 것 같다.
### word n-grams
ngram 확장이 (0,2), (0,6) 일때 마지막 (0,6)이 (2,6)과 같은 값을 갖는걸 확인할 수 있었다. 이는 hash collision으로 일종의 버그로 추측되며, 3 이상일때 문제가 발생한다.