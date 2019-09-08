---
layout: post
title: 해석 가능한 머신러닝
tags: ["Machine Learning, Statistics"]

---

<div class="message">
딥러닝 및 머신러닝의 결과 해석에 대한 다양한 논문과 제품을 살펴보고 정리한다.
</div>

<small>
*2019년 9월 8일 초안 작성*  
</small>

<!-- TOC -->

- [본론](#본론)
    - [Decision Tree](#decision-tree)
    - [Random Forest](#random-forest)
    - [Interpretable ML](#interpretable-ml)
        - [책 및 학회, 링크](#책-및-학회-링크)
        - [LIME, SHAP, ELI5](#lime-shap-eli5)
- [References](#references)

<!-- /TOC -->

## 본론
해석 가능성<sup>Interpretable</sup>은 매우 중요하다. 통계학에서도 이를 위한 기술 통계학<sup>Descriptive Statistics</sup>은 매우 주목받는 분야이기도 하다.

### Decision Tree
A decision tree is a flowchart-like structure in which each internal node represents a “test” on an attribute (e.g. whether a coin flip comes up heads or tails), each branch represents the outcome of the test, and each leaf node represents a class label (decision taken after computing all attributes). The paths from root to leaf represent classification rules. [^fn-visualize]

[^fn-visualize]: <https://medium.com/greyatom/decision-trees-a-simple-way-to-visualize-a-decision-dc506a403aeb>

scikit-learn은 기본적인 시각화를 지원한다. 아래는 [타이타닉 데이타 분석 결과](https://nbviewer.jupyter.org/github/likejazz/jupyter-notebooks/blob/master/machine-learning/titanic.ipynb)이다.

<img src="https://raw.githubusercontent.com/likejazz/jupyter-notebooks/master/machine-learning/data/titanic.png">

[dtreeviz](https://explained.ai/decision-tree-viz/index.html)는 매우 직관적으로 보여준다. 아래는 동일한 트리를 표현한 결과로 훨씬 보기 좋다.

<img src="https://user-images.githubusercontent.com/1250095/55542969-0f04c500-5703-11e9-860f-749b987d33c1.png">

아래는 [How to visualize decision trees](https://explained.ai/decision-tree-viz/index.html)를 소개하는 발표 영상이다.
<iframe width="560" height="315" src="https://www.youtube.com/embed/4FC1D9SuDBc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

참고로 타이타닉의 경우 Decision Tree는 80.9%, Random Forests는 81.6% 성능을 보여준다. 타이타닉 자체의 데이터 변별력이 부족하므로 큰 의미는 없으나 [전처리를 통해 92%까지](https://towardsdatascience.com/predicting-the-survival-of-titanic-passengers-30870ccc7e8) 높일 수 있다.

### Random Forest
배깅을 통한 Random Forest 부터는 각각의 피처를 통한 시각화는 쉽지 않다. 이는 부스팅도 마찬가지이며, 이 경우 feature importance로 해석을 시도한다. 그런데 scikit-learn의 경우 feature importance를 보여줄순 있으나, [bias를 가지므로 주의](https://explained.ai/rf-importance/index.html)해야 한다. [rfpimp 프로젝트](https://github.com/parrt/random-forest-importances)는 신뢰성 높은 결과를 보여주며, 최근(Jul 2019) scikit-learn은 [permutation importance 구현](https://github.com/scikit-learn/scikit-learn/pull/13146)을 머지했다.

참고로 파이썬 데이터 구조를 시각화하는 [lolviz](https://github.com/parrt/lolviz)도 있다.

### Interpretable ML
#### 책 및 학회, 링크
- [The Mechanics of Machine Learning](https://mlbook.explained.ai)  
dtreeviz의 Terence Parr와 fast.ai의 Jeremy Howard가 함께 쓰고 있는 책
- [Interpretable Machine Learning](https://christophm.github.io/interpretable-ml-book/)  
Making Black Box Models Explainable을 주제로 Christoph Molnar가 쓰고 있는 책. 이 글의 제목 또한 이 책과 동일하다.
- [Interpretable ML Symposium](http://interpretable.ml) NIPS 2017
- [Interpretable Machine Learning(한글)](https://zzsza.github.io/data/2019/04/14/interpretable-ml-intro/)

#### LIME, SHAP, ELI5
여기서는 LIME, SHAP, ELI5를 통한 시각화에 보다 집중한 자료를 소개한다.
- [Introduction to Model Interpretability](https://github.com/klemag/pydata_nyc2018-intro-to-model-interpretability) PyData NYC 2018
- [Explainable AI: ELI5,LIME and SHAP](https://www.kaggle.com/kritidoneria/explainable-ai-eli5-lime-and-shap) Kaggle Kernel
- [Introducing SHAP Decision Plots](https://towardsdatascience.com/introducing-shap-decision-plots-52ed3b4a1cba)

LIME은 [UCI News를 Random Forest로 분류하고 시각화](https://nbviewer.jupyter.org/github/likejazz/jupyter-notebooks/blob/master/machine-learning/news-classification.ipynb) 할때 유용하게 활용한 바 있다.

특히 SHAP은 이 중 가장 활발한 연구가 진행되고 있으며, 연구를 주도하는 Scott Lundberg는 지금도 꾸준히 개선 중이다. 트리 앙상블을 고속으로 해석하는 TreeExplainer를 별도로 제공하며, SHAPley Values를 [React로 만든 별도 js 라이브러리](https://github.com/interpretable-ml/iml)를 이용해 시각화 한다. 주피터 전용으로 구현되어 있으나 수정을 거쳐 js 라이브러리를 떼내어 활용할 수 있으며, 실제로 2019년 3월에 열린 카카오 사내 해커톤에서 이를 이용한 타이타닉 생존 예측 시각화를 별도 웹 서비스로 구현해 진행했다.

<img src="https://user-images.githubusercontent.com/1250095/64486971-5b829c80-d26f-11e9-9088-73af471698e8.jpg" width="70%">

예측 모델은 PyTorch를 이용한 Multi-Layer Perceptron으로 구현했으며, 노트북에 보이는 데모는 타이타닉의 주인공 Jack Dawson(Leonardo Dicaprio)의 사망 확률을 해석한 것으로, 빨간색은 사망에 영향을 준 요인(features)을 시각화 한 그래프이다. 빨간색이 파란색 보다 훨씬 더 길고, 따라서 Jack은 92% 확률로 사망하게 된다.

## References