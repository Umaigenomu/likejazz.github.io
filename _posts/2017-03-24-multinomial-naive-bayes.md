---
layout: post
title: 다항 분포 나이브 베이즈 전개
invisible: true
---

<div class="message">
데이타 사이언스 스쿨의 노트북을 참고하여 보다 상세하게 정리[1]
</div>

*2017년 3월 24일 초안 작성*

## 내용

## Multinomial Naive Bayes

IIR 책 챕터 13 Naive Bayes에 상세한 전개와 수도 코드를 제공한다.
SO 답변 찾아서 정리

노트북: https://nbviewer.jupyter.org/github/likejazz/likejazz.github.io/blob/master/public/notebooks/multinomial-naive-bayes.ipynb

데이타 사이언스 스쿨의 노트북을 참고하여 보다 상세하게 정리[1]

[1]: https://www.datascienceschool.net/view-notebook/c19b48e3c7b048668f2bb0a113bd25f7/#다항-분포-나이브-베이즈-모형


```python
import numpy as np
np.random.seed(0)
X = np.random.randint(2, size=(10, 4))
y = np.array([0,0,0,0,1,1,1,1,1,1])
```


```python
X
```




    array([[0, 1, 1, 0],
           [1, 1, 1, 1],
           [1, 1, 1, 0],
           [0, 1, 0, 0],
           [0, 0, 0, 1],
           [0, 1, 1, 0],
           [0, 1, 1, 1],
           [1, 0, 1, 0],
           [1, 0, 1, 1],
           [0, 1, 1, 0]])




```python
y
```




    array([0, 0, 0, 0, 1, 1, 1, 1, 1, 1])




```python
from sklearn.naive_bayes import MultinomialNB
clf = MultinomialNB().fit(X, y)
```


```python
# y classes
clf.classes_
```




    array([0, 1])




```python
# y classes의 갯수
clf.class_count_
```




    array([ 4.,  6.])




```python
# 각 y class의 X elements 갯수
fc = clf.feature_count_
fc
```




    array([[ 2.,  4.,  3.,  1.],
           [ 2.,  3.,  5.,  3.]])




```python
# 각 y class의 X elements 합, axis는 값을 합산하는 축
# axis=None(default): elements 전체 합
# axis=0: y 축 기준 합 
fc.sum(axis=0)
```




    array([ 4.,  7.,  8.,  4.])




```python
# axis=1: x 축 기준 합
fc.sum(axis=1)
```




    array([ 10.,  13.])




```python
# newaxis는 길이 1의 새로운 축 생성. None과 동일하다.
fc.sum(axis=1)[:, np.newaxis]
```




    array([[ 10.],
           [ 13.]])




```python
# x 축 기준 합을 반복 축 따라(axis=1) 4회 반복.
np.repeat(fc.sum(axis=1)[:, np.newaxis], 4, axis=1)
```




    array([[ 10.,  10.,  10.,  10.],
           [ 13.,  13.,  13.,  13.]])




```python
# 아래 계산값을 보기 편하도록 한 번 더 출력
fc
```




    array([[ 2.,  4.,  3.,  1.],
           [ 2.,  3.,  5.,  3.]])




```python
# 각 y class의 X elements 갯수를 X elements 합으로 나눈 값이 된다. 
fc / np.repeat(fc.sum(axis=1)[:, np.newaxis], 4, axis=1)
```




    array([[ 0.2       ,  0.4       ,  0.3       ,  0.1       ],
           [ 0.15384615,  0.23076923,  0.38461538,  0.23076923]])




```python
# 라플라스 스무딩 출력
clf.alpha
```




    1.0




```python
# 위 수식에서 라플라스 스무딩을 적용하면 아래와 같다.
(fc + clf.alpha) / 
    (np.repeat(fc.sum(axis=1)[:, np.newaxis], 4, axis=1) 
        + clf.alpha * X.shape[1])
```




    array([[ 0.21428571,  0.35714286,  0.28571429,  0.14285714],
           [ 0.17647059,  0.23529412,  0.35294118,  0.23529412]])



상기 수식은 여러 조건부 확률 $$ (P(t_k \| c),1 \leq k \leq n_d) $$ 이 곱해지므로 실수형 계산에서 언더플로우 현상이 발생할 수 있다. 라플라스 스무딩으로 방지할 수 있지만, 이 문제를 개선하기 위해 각 조건부 확률의 로그 값을 구해서 곱하기 대신 더하기를 사용한다.


```python
# scikit-learn 라이브러리도 스무딩을 적용한 로그 확률로 계산한다.
clf.feature_log_prob_
```




    array([[-1.54044504, -1.02961942, -1.25276297, -1.94591015],
           [-1.73460106, -1.44691898, -1.04145387, -1.44691898]])




```python
# 로그 확률의 지수 함수를 구하면 상기 확률의 값과 동일함을 확인할 수 있다. 
theta = np.exp(clf.feature_log_prob_)
theta
```




    array([[ 0.21428571,  0.35714286,  0.28571429,  0.14285714],
           [ 0.17647059,  0.23529412,  0.35294118,  0.23529412]])




```python
# 새로운 데이타를 scikit-learn 라이브러리가 예측한 확률
x_new = np.array([1,1,0,0])
clf.predict_proba([x_new])
```




    array([[ 0.55131629,  0.44868371]])




```python
# scikit-learn의 클래스 사전 확률 출력, 
# fit_prior 파라미터이며 디폴트는 True로 적용.
clf.class_log_prior_
```




    array([-0.91629073, -0.51082562])




```python
# 클래스 사전 확률의 지수 함수 값
np.exp(clf.class_log_prior_)
```




    array([ 0.4,  0.6])




```python
# 클래스 사전 확률 직접 계산. sckit-learn과 일치한다.
np.log(clf.class_count_) - np.log(clf.class_count_.sum())
```




    array([-0.91629073, -0.51082562])




```python
# 새로운 데이타의 조건부 확률 제곱의 곱
(theta ** x_new).prod(axis=1)
```




    array([ 0.07653061,  0.04152249])




```python
# 클래스 사전 확률의 지수 값을 함께 곱한다.
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


