여러가지 독서 후기를 정리한다.  

# 헬로 데이터 과학
"만약 나에게 문제 해결을 위해 한 시간이 주어진다면, 나는 55분 동안 문제에 대해 생각하고 5분 동안 해결책에 대해 생각하겠다." - 아인슈타인

# 인공지능: 현대적 접근방식
probability model  
prob comes from
- frequentist<sup>빈도주의자</sup>
- objectivist<sup>객관주의자</sup>
- subjectivist<sup>주관주의자</sup>

몬테카를로 알고리즘 = randomized sampling  
- markov chain sampling  
- markov chain monte carlo(MCMC)  
- markov decision process(MDP)
- HMM: Hidden Markov Model

likelihood weighting  
gibs sampling, 베이즈망에 적합  
kalman filter  
game theory  
ockham's razor: 자료와 일관된 가설들 중 가장 간단한 것을 선호하라  
가우스 분포
- mixture of Gaussian 가우스 혼합 분포


# 함께 일하고 싶은 팀장<sup>6 Habits of Highly Effective Bosses</sup>
- 호손 효과
  - 변인에 따라 생산성이 변하지 않는다는 연구 결과이나 실제로는 실험 대상자가 관찰되고 있다는 사실을 인지하고 있었고 이 점이 연구결과에 영향을 끼치는 것을 뜻한다.
- X 이론, Y 이론[5]
  - W 이론: 서울대 이면우 교수가 주창. 대학 신입생때 학교 권장 도서로 읽었던 기억이 남.

  [5]: https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y

## 6가지 습관
- 자신을 들여다 볼 줄 안다.
- 부하직원과의 공감대를 중요시한다.
- 인간관계의 황금률<sup>Golden Rule</sup>을 지킨다.
  - 상대방의 입장이라면?
- 부하직원과 알맞은 선을 유지한다.
- 지혜롭게 비판한다.
- 직원들의 다양한 스타일에 적응한다.

2005년에 출판된 책으로 현 시점에 크게 색다르지 않으며 Y 이론 중심의 팀장 역할을 강조

# 함수형 사고

# Building Machine Learning Systems with Python
- 상관 관계<sup>correlation coefficient</sup>
- spline 모델
- 과적합 방지를 위해 데이타를 쪼개어 선형으로 예측하는 것이 합리적
- z-score
<img src="http://stats.seandolinar.com/wp-content/uploads/2014/12/Normal_Z_Comparison.png" width="80%" />[1]  
`$$z = \frac{x - \mu}{\sigma}$$`

[1]: <http://stats.seandolinar.com/calculating-z-scores-with-r/>

- scikit-learn의 CountVectorizer. 단어를 세고 벡터로 표현
- add-one smoothing, additive smoothing, Laplace<sup>라플라스</sup> smoothing

- 자연로그: e를 밑으로 하는 로그

불확실성 측정: Claude Shannon의 정보 엔트로피, 정보 엔트로피<sup>information entropy</sup>는 또는 섀넌 엔트로피<sup>Shannon entropy</sup> 확률이 낮을 수록 엔트로피는 증가한다.

sklearn.feature_selection 뛰어난 래퍼 클래스
- RFE<sup>recursive feature elimination</sup>

속성 추출 기법
- 선형 PCA<sup>principal component analysis</sup> 선형 제한
- 비선형 MDS<sup>multidimensional scaling</sup>

PCA
1. 데이터에서 평균값 빼서 데이터를 중심에
1. 공분산<sup>covariance</sup> 매트릭스 계산
1. 공분산의 고유벡터<sup>eigenvector</sup> 계산

거리는 대부분 유클리드 거리

# 마스터 알고리즘
머신러닝 다섯 종족  
<img src="https://sebastianraschka.com/images/faq/classifier_categories/master_chart.jpg" width="47%" style="padding-right: 10px; float: left" /><img src="https://github.com/likejazz/likejazz.github.io/blob/master/images/2017/master-algorithm.png" width="47%" />

왼쪽 [Sebastian Raschka의 정리](https://sebastianraschka.com/faq/docs/classifier-categories.html#pedro-domingos-5-tribes-of-machine-learning)와 오른쪽은 직접 책에서 촬영

흄 귀납의 문제<sup>Hume's problem of induction</sup>[3]
- induction: 유도, 유발, 귀납
- 역사상 가장 위대한 18세기 철학자
- 세상에 공짜는 없다. 공짜 점심은 없다. 데이비드 월퍼트<sup>David Wolpert</sup>
  - No free lunch in search and optimization, 1995[4]
  - 전체를 최적화 할 수 없고 영역을 제한하여 선택적 최적화를 해야 한다.

[3]: http://no-smok.net/nsmk/%EA%B7%80%EB%82%A9%EC%9D%98%EB%AC%B8%EC%A0%9C
[4]: https://en.wikipedia.org/wiki/No_free_lunch_in_search_and_optimization

지수함수<sup>exponential function</sup> `$$e^x$$`, exp
- e(자연상수, 오일러의 수, 네이피어 상수) 값은 x = 0 일때 기울기 45도[2]
- ln = `$$\log_{e}$$` 자연로그

[2]: http://www.librow.com/articles/article-11/appendix-a-20

<img src="http://www.librow.com/content/common/images/articles/article-11/graph-exp.gif" width="50%" />

fig. Graph of exponential function `$$y=e^x$$`

기호주의자
- 키넥트 의사 결정 트리
- 논리규칙으로 정의할 수 있는 개념은 빙산의 일각에 불과하다는 연결주의자의 주장  

# 세계를 바꾼 17가지 방정식
'세상을 바꾼'으로 번역하는게 더 적절할듯

## 피타고라스 정리
- 3-4-5 삼각형, 5-12-13 삼각형
- 유클리드 증명: 피타고라스 정리 증명
- 모든 삼각형은 두 개의 직각 삼각형으로 쪼갤 수 있다.
- 가우스 곡률
  - 곡면의 한 점의 굽은 정도를 나타내는 측도로서, 그 점의 두 주곡률의 곱이다.
  - 곡면이 얼마나 휘어 있는가를 재는 양
- 삼각측량

## 로그  
`$$\log{xy}=\log{x}+\log{y}$$`
- 자연로그는 `$$e^x$$`의 함수
- `$$10^x=4$$` 로그 계산법
- `$$5^\frac{2}{3}=\sqrt[3]{5^2}{\approx}2.924$$`
- 상용로그는 계산을 쉽게 하기 위함이므로 컴퓨터가 발달한 오늘날엔 더 이상 유용하지 않지만 개념적 이유로 과학에서 핵심적인 역할을 하고 있음

## -1의 제곱근
- 허수<sup>Imaginary Numbers</sup>
