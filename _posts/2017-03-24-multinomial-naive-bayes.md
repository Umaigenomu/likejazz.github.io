---
layout: post
title: 다항 분포 나이브 베이즈 알고리즘 전개
---

<div class="message">
문장 분류에서 기대 이상으로 잘 동작하는 다항 분포 나이브 베이즈를 실제로 계산해보고, 이 값이 scikit-learn 라이브러리의 결과와 일치하는지 알고리즘의 전개를 직접 진행하며 비교해보도록 한다.
</div>

*2017년 3월 24일 초안 작성*

## 내용
### 나이브 베이즈
scikit-learn의 나이브 베이즈 모듈인 `sklearn.naive_bayes`는 총 3가지 나이브 베이즈 분류기를 제공한다.
1. Gaussian Naive Bayes
1. Multinomial Naive Bayes
1. Bernoulli Naive Bayes

이 중 가장 단순하면서 베이즈 룰과 거의 차이가 없는 형태로 가장 빠른 성능을 보이는 다항 분포 나이브 베이즈<sup>Multinomial Naive Bayes</sup>를 실제로 알고리즘을 전개하면서 살펴보도록 한다.

원래는 노트북을 마크다운으로 export하여 그대로 문서 형태로 게시하려 했으나 노트북 결과와 달리 마크다운으로 했을때 코드와 결과의 구분이 어려워 제대로 이해하기가 쉽지 않았다. 따라서, 문서와 노트북을 분리하여 문서에는 여러가지 부연 설명을 곁들이고, 노트북은 링크로 대체하도록 한다.

### 뉴스 분류
먼저, 캐글(Kaggle)의 뉴스 데이타를 이용, 뉴스 제목으로 카테고리를 분류하는 실험을 진행해봤다. [평가가 가장 좋았던 커널을 fork하여 하나씩 진행](https://nbviewer.jupyter.org/github/likejazz/likejazz.github.io/blob/master/public/notebooks/news-classification.ipynb)해보니 랜덤 포레스트에서 84% 기록, 디시젼 트리만 해도 80%가 넘는 수치를 기록했다. [CNN 딥러닝이 80% 언저리에서 계속 고전](http://docs.likejazz.com/cnn-text-classification-tf/)했던걸 생각해보면 훨씬 빠르게 유사 혹은 능가하는 정확도를 기록한 셈이다. 놀랍게도 **다항 분포 나이브 베이즈는 90%가 넘는 정확도를 기록**했는데 속도 또한 다른 알고리즘과 비교가 안될 정도로 빠르다.

다시, [나이브 베이즈 간 비교를 진행](https://nbviewer.jupyter.org/github/likejazz/likejazz.github.io/blob/master/public/notebooks/news-classification-nb.ipynb)해보니 마찬가지로 가장 단순한 다항 분포 나이브 베이즈가 가우시안이나 베르누이에 비해 성능이 좋았고 속도 또한 가장 빠르다. 물론 이는 데이타의 특성이 반영된 결과로 항상 다항 분포가 가장 정확한건 아니다. 하지만 18세기에 등장한 이 간단한 수식이 21세기에도 여전히 최고의 알고리즘 이라는데에는 그저 놀라울 따름이다.

<img src="http://strangenotions.com/wp-content/uploads/BayesTheorem-600x319.jpg" width="100%" />

### 다항 분포 나이브 베이즈
다항 분포 나이브 베이즈의 수도(pseudo) 코드는 Introduction to Information Retrieval(Manning et al. 2008) 책 챕터 13에 잘 나와 있다.

<img src="/images/2017/multinomialnb.png" width="70%" />

이 책은 전문이 PDF 형태로 온라인에 무료 공개 되어 있으며 다음 링크를 따라 확인할 수 있다. [IIR 챕터 13. Text classification and Naive Bayes(PDF)](https://nlp.stanford.edu/IR-book/pdf/13bayes.pdf)

[직접 계산을 진행한 노트북](https://nbviewer.jupyter.org/github/likejazz/likejazz.github.io/blob/master/public/notebooks/multinomial-naive-bayes.ipynb)은 링크에서 볼 수 있다. 모든 항목에 상세히 주석을 달았으므로 어렵지 않게 볼 수 있을 것이다.

### 노트북
노트북에서 중요한 몇 부분만 좀 더 살펴보면, 각 특징의 확률은 X elements 갯수를 X elements 합으로 나눈 값에 라플라스 스무딩을 적용한 결과이며 아래와 같다.

```python
(fc + clf.alpha) / 
    (np.repeat(fc.sum(axis=1)[:, np.newaxis], 4, axis=1) 
        + clf.alpha * X.shape[1])
```

    array([[ 0.21428571,  0.35714286,  0.28571429,  0.14285714],
           [ 0.17647059,  0.23529412,  0.35294118,  0.23529412]])

이 확률 $$ P(t_k \| c) $$ 를 이용한 최대 사후 클래스 수식은 아래와 같다.
<img src="/images/2017/max-post-class.png" width="70%" />

상기 수식은 여러 조건부 확률 $$ (P(t_k \| c),1 \leq k \leq n_d) $$ 이 곱해지므로 실수형 계산에서 언더플로우 현상이 발생할 수 있다. 이 문제를 개선하기 위해 각 조건부 확률의 로그 값을 구해서 곱하기 대신 더하기를 사용한다. (Manning et al. Introduction to IR. ch13)

딥러닝에서 기울기 소실 문제<sup>Vanishing Gradient Problem</sup>와 유사한 문제다. scikit-learn 라이브러리는 `.predict_proba`에서, 계산한 로그 확률을 지수 함수로 스케일링하여 처리한다.

```python
# 새로운 데이타의 조건부 확률 제곱의 곱에 클래스 사전 로그 확률의 지수 값을 함께 곱한다.
# 다항 분포(Multinomial Distribution) 적용
# 예를 들어 문장 분류에서 이 값은 문서의 단어 수
p = (theta ** x_new).prod(axis=1) * np.exp(clf.class_log_prior_)
p
```

    array([ 0.03061224,  0.02491349])

```python
# 이 값을 합으로 나누어 백분율로 환산하면,
# scikit-learn의 예측값과 동일함을 확인할 수 있다.
p / p.sum()
```

    array([ 0.55131629,  0.44868371])

알고리즘을 전개하여 계산한 값이 scikit-learn 라이브러리의 예측값과 동일함을 확인할 수 있다. 보다 상세한 내용은 [노트북에서 직접 확인](https://nbviewer.jupyter.org/github/likejazz/likejazz.github.io/blob/master/public/notebooks/multinomial-naive-bayes.ipynb) 가능하다.