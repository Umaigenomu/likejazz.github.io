---
layout: post
title: 딥러닝 용어 정리
invisible: false
---

*2017년 1월 19일 출판*  
*2017년 1월 15일 초안 작성*

  - [선형대수학](#section)
  - [Numpy](#numpy)
  - [신경망](#section-1)
    - [층의 갯수와 크기 설정](#section-2)
  - [활성화 함수<sup>Activation Function</sup>](#supactivation-functionsup)
  - [손실 함수<sup>Cost or Loss or Error Function</sup>](#supcost-or-loss-or-error-functionsup)
  - [미분](#section-3)
  - [최적화<sup>Optimization</sup>](#supoptimizationsup)
    - [확률적 경사 하강법<sup>SGD, Stochastic Gradient Descent</sup>](#supsgd-stochastic-gradient-descentsup)
    - [Adam<sup>Adaptive Moment Estimation</sup>](#adamsupadaptive-moment-estimationsup)
  - [기울기<sup>Gradient</sup>](#supgradientsup)
  - [기울기 소실<sup>Gradient Vanishing</sup>](#supgradient-vanishingsup)
  - [역전파<sup>Backpropagation</sup>](#supbackpropagationsup)
  - [기울기 체크<sup>Gradient Check</sup>](#supgradient-checksup)
  - [배치 정규화<sup>Batch Nomarlization</sup>](#supbatch-nomarlizationsup)
  - [가중치 감소<sup>Weight Decay</sup>](#supweight-decaysup)
  - [Keras](#keras)
  - [CNN](#cnn)
    - [VGG16](#vgg16)
  - [층을 깊게 하는 이유](#section-4)
- [References](#references)

## 선형대수학
<img src="https://www.mathsisfun.com/algebra/images/scalar-vector-matrix.gif" width="400" />[^1]

<img src="/images/2017/greek-letters.png" width="400" />[^4]

- 자연로그의 역함수 $$ e^x = exp(x) $$  
- 자연상수 $$ e = 2.7182 $$

---
[딥러닝 용어표](https://docs.google.com/spreadsheets/d/1ccwGiC01X-gs3PPcXPUz67W9rS6l994LD4AL18KF1_0/edit#gid=0)

---
통계에 주로 사용되는 수식 LaTex 표현  
[LaTex Equations](https://github.com/rasbt/pattern_classification/blob/master/resources/latex_equations.md)

## Numpy
{% highlight python %}
A = np.array([[1,2,3],[4,5,6]])
B = np.array([[2,2,3],[3,3,4]])
print (type(A))
<type 'numpy.ndarray'>
print (A.dtype) # 배열의 원소 타입
int64
print (A.shape) # 배열의 형상
(2, 3)
print (A.ndim)  # 배열의 차원
2
print (np.eye(3))
[[ 1.  0.  0.]
 [ 0.  1.  0.]
 [ 0.  0.  1.]]
# np.arange(start, stop=None, step=1, dtype=None)
print np.arange(0.0, 0.4, 0.1)
[ 0.   0.1  0.2  0.3]
{% endhighlight %}

- `*` in Numpy is element-wise multiplication.  
- `np.dot`(=`tf.matmul`) is matrix multiplication.

## 신경망
<img src="http://cs231n.github.io/assets/nn1/neuron.png" width="49%" style="margin-right: 10px; float: left" /><img src="http://cs231n.github.io/assets/nn1/neuron_model.jpeg" width="49%" />[^18]   
퍼셉트론은 활성화 함수로 계단 함수 사용. 이를 다른 함수로 변경하는 것이 신경망의 핵심. 활성화 함수는 비선형(시그모이드등)이어야 한다. 선형은 은닉층이 없는 네트워크로 표현가능하기 때문

<img src="/images/2017/neural-network.png" width="500" />
8개 은닉층으로 구현한 XOR 신경망 구조에서 학습 가능 파라미터는 은닉층 24개(W 16, b 8), 출력층 9개(W 8, b 1). Keras에서는 `model.summary()`로 확인 가능.

---

XOR과 달리 sin 그래프 같은 비선형 결과는 오버피팅 되어 학습이 쉽지 않다.

<img src="/images/2017/histogram-w.png" width="49%"  style="margin-right: 10px; float: left" />
<img src="/images/2017/target-predict.png" width="49%" />
<p style="clear: both"></p>

fc 2개층 각 1,000개 뉴런을 학습 후 첫번째 레이어의 $$w$$ 1,000개 히스토그램 그리고 sin 그래프 실제 결과와 예측 결과 그래프. 5개 포인트를 학습없이 연달아 예측하니 패턴은 비슷하나 많이 빗나간 것을 확인할 수 있다. 1개씩만 비워둔 4,9번 지점은 실제 값과 거의 차이가 없음. 각 구간별 비어 있는 1~2개씩을 예측하는 형태가 이상적이며 LSTM으로 학습하면 훨씬 더 좋은 결과가 나올 것이다.

### 층의 갯수와 크기 설정
은닉층이 하나 일때 뉴런 갯수에 따른 의사 결정 영역<sup>Decision Regions</sup>은 아래와 같이 표현된다. 원의 색상을 분류하는 예제이며, 뉴런이 많을수록 표현력이 좋아진다.[^18]  
<img src="http://cs231n.github.io/assets/nn1/layer_sizes.jpeg" width="95%" />
[ConvNetJS에서 실행 가능한 데모](http://cs.stanford.edu/people/karpathy/convnetjs/demo/classify2d.html) 제공

## 활성화 함수<sup>Activation Function</sup>
- ReLU, He 초기값(표준편차 $${\sqrt{\frac{n}{2}}}$$), 편향(b)은 0으로 초기화하는게 일반적[^7]
<img src="http://nmhkahn.github.io/assets/NN/relu.jpg" />[^7]
- Sigmoid $${\sigma}(x) = \frac{1}{1 + e^{-x}}$$ Xavier 초기값(표준편차 $${\frac{1}{\sqrt{n}}}$$)
<img src="http://nmhkahn.github.io/assets/NN/sigmoid.jpg" />[^7]
- $$tanh(x) = 2{\sigma}(2x) -1$$ 시그모이드로 간단히 표현할 수 있다.
<img src="http://nmhkahn.github.io/assets/NN/tanh.jpg" />  
시그모이드와 달리 함수값이 zero-centered 되어 있다.
- Softmax 다중 분류

시그모이드의 초기값에 대해,

- 표준편차<sup>stddev</sup> 1 정규분포: 활성화값 0,1에 다가감. 기울기 소실 발생
- 표준편차 0.01 정규분포: 가운데 몰림. 값이 치우치므로 표현력에 문제

<img src="/images/2017/a-sgd.png" width="49%"  style="margin-right: 10px; float: left" />
<img src="/images/2017/a2-sgd.png" width="49%" />

<p style="clear: both"></p>
SGD로 학습할때 $$a_{57}$$(임의의 뉴런)의 시그모이드 활성화값 그래프. 두 번 학습한 각각의 결과

## 손실 함수<sup>Cost or Loss or Error Function</sup>

Cost/Loss/Error 모두 동의어다.[^3]  

- MSE<sup>Mean Squared Error</sup> 정답과의 거리 제곱 평균. 표준 편차와 유사  
SSE는 Sum of Squared Errors이며 따라서 $$MSE={\frac{1}{n}}{\times}SSE$$ 이다.

'밑바닥부터 시작하는 딥러닝'에서는 MSE로 표현했으나 *Mean* 이 아닌 실제로는 경사 하강법<sup>Gradient Descent</sup> 수식, SSE에 $${\frac{1}{2}}$$ 값을 취한 형태로 손실 함수 사용:

$$E={\frac{1}{2}}{\sum_{k}}(y_k-t_k)^2$$

- $$y_k$$: 신경망 출력
- $$t_k$$: 정답 레이블
- $$k$$: 데이타의 차원 수

MSE는 아래와 같은 형태로 사용한다.

$$E={\frac{1}{k}}{\sum_{k}}(y_k-t_k)^2$$

여기서 $$k$$는 학습 데이타 수

앤드류 응의 머신러닝 강좌를 보면 [손실 함수로 MSE의 1/2][10]을 취하는데 [이에 대한 자세한 소개][9]. 계산을 쉽게 하기 위함이며 MSE 앞에 One Half를 붙인 One Half Mean Squared Error.

- CEE<sup>Cross Entropy Error</sup>

$$E=-{\sum_{k}t_k{\log{y_k}}}$$

원-핫 인코딩<sup>One-Hot Encoding</sup>일때는 정답의 로그 그래프

---

손실 함수로 학습하는 이유는 정확도는 단계<sup>Step</sup>가 길지만 손실 함수는 매우 민감하게 반응. 활성화 함수로 계단 함수<sup>Step Function</sup>을 사용하지 않는 것과 동일.

시그모이드의 미분(접선)은 어느 장소에도 0이 되지 않기 때문에 신경망 학습에 유리

## 미분
- 수치 미분: 아주 작은 차분으로 미분을 구함  
- 편미분: 변수가 여럿인 함수에 대한 미분

<img src="/images/2017/derivatives.png" width="400" />[^11]
(a) 전진차분, (b) 후진차분, (c)중앙차분<sup>Centered Finite-Divided-Difference</sup>의 그래픽 표현 비교. 중앙차분이 실제미분과 가장 가까운 것을 확인할 수 있다.[^8]

$$ f^{'}(x){\approx}{\frac {f(x+h)-f(x-h)}{2h}} $$

수치 미분의 h 즉, $${\delta}$$ 값은 0.0001로 지정. 범위가 클수록 해석적 미분의 값과 차이남.

## 최적화<sup>Optimization</sup>

### 확률적 경사 하강법<sup>SGD, Stochastic Gradient Descent</sup>
SGD는 일반적으로 미니 배치<sup>Mini-Batch</sup>를 사용하는 경우에 사용.
이전에 가중치 매개 변수에 대한 손실 함수 기울기는 수치 미분을 사용해 구하고 기울기의 10%(학습률 0.1) 만큼 이동하도록 구현했음

경사 하강법의 가중치 업데이트(기울기 방향 변화):

$$ w_i \leftarrow w_i-\eta\frac{\partial E}{\partial w_i}$$

<img src="/images/2017/w-sgd.png" width="80%" />

SGD로 학습할때 $$w_{1950}$$(임의의 가중치)의 값 변화 그래프. 항상 일정 방향이 아닌 여러번 기울기 방향이 변하는 모습을 확인할 수 있음.

다른 최적화 알고리즘

- Momentum
- AdaGrad
- Adadelta
- RMSprop

### Adam<sup>Adaptive Moment Estimation</sup>
최근에 주로 많이 사용하며 아래 수식으로 전개[^16]

$$v_t = \beta_2 v_{t-1} + (1 - \beta_2) g_t^2.$$  
$$m_t = \beta_1 m_{t-1} + (1 - \beta_1) g_t.$$

- $$v_t$$: 과거 기울기 제곱의 평균
- $${m_t}$$: 과거 기울기의 평균
- $${\beta_1}$$와 $${\beta_2}$$는 1에 가까움

$$\hat{m}_t = \dfrac{m_t}{1 - \beta^t_1}$$.  
$$\hat{v}_t = \dfrac{v_t}{1 - \beta^t_2}$$.

이제 Adadelta, RMSProp와 유사한 형태로 매개변수 업데이트

$$\theta_{t+1} = \theta_{t} - \dfrac{\eta}{\sqrt{\hat{v}_t} + \epsilon} \hat{m}_t.$$

논문에서는 기본값으로 아래 값을 제안

- $$\beta_1$$: 0.9
- $$\beta_2$$: 0.999
- $$\epsilon$$: $$10^{-8}$$

각 알고리즘 시각화[^17]  
<img src="http://cs231n.github.io/assets/nn3/opt2.gif" width="49%" style="margin-right: 10px; float: left" /><img src="http://cs231n.github.io/assets/nn3/opt1.gif" width="49%" />

위 시나리오에서는 Adagrad, Adadelta, RMSprop, Adam(위 시각화에는 나와 있지 않으나 유사)이 가장 적합한 모습을 보여준다.

## 기울기<sup>Gradient</sup>

$$ {\Delta}w_i = -\eta\frac{\partial E}{\partial w_i},$$

- $${\eta}$$: 학습률<sup>Learning Rate</sup>

가중치 갱신은 비용 기울기<sup>Cost Gradient</sup>의 반대 방향으로 진행  
기울기<sup>Gradient</sup> 모든 편미분을 벡터로 정리  

## 기울기 소실<sup>Gradient Vanishing</sup>
신경망이 깊을때 활성화 함수를 통한 기울기 값 0 ~ 1은 매우 작은 값이고 역전파<sup>Backpropagation</sup>중에 배가되어 깊은 망에서 소실<sup>Vanishing</sup>되는 효과를 가져온다. ReLU와 LSTM 아키텍처를 사용하여 해결하는 방법이 일반적이다.

## 역전파<sup>Backpropagation</sup>
[^15]
역전파를 사용하지 않고 기울기를 구하려면 모든 $$w_{i}$$ 값에 대해 수치 미분을 구해야 하며 따라서 모든 $$w_{i}$$에 대해 손실 함수를 계산해야 하므로 매우 느리다.

'밑바닥부터 시작하는 딥러닝' 책에서는 역전파를 사용하지 않고 전체 기울기를 계산하여 $$W, b$$를 한 번에 업데이트 하는 예제를 보여주는데 매우 느리다. 그러나 역전파를 사용하면 $$W$$에 대한 수치 미분만 계산하여 역으로 전달하므로 엄청난 속도 개선이 가능하다.

## 기울기 체크<sup>Gradient Check</sup>
그러나 계산이 비교적 간편한 수치 미분과 달리 해석적 미분을 통한 역전파는 잘못 계산할 우려가 있으므로 두 값이 서로 일치하는지 확인하는 작업이 필요하다.

## 배치 정규화<sup>Batch Nomarlization</sup>
fc와 ReLU 사이 BN 레이어 삽입. 데이타 분포 평균 0, 분산 1이 되도록 정규화. 학습 속도를 높이는 효과가 있다.[^13]

## 가중치 감소<sup>Weight Decay</sup>
오버피팅을 줄이기 위해 큰 가중치에 대해 페널티

- L2 norm: $$a=(0.5,0.5)$$ 일때 $$\|a\|_2=\sqrt{0.5^2+0.5^2}=1/\sqrt{2}$$
- L2 정규화<sup>L2 Regularization</sup> 법칙: L2 norm을 이용한 정규화 법칙. 즉, 각 원소 제곱합의 제곱근(표준 편차와 유사) $$W={\sqrt{W_1^2+W_2^2+...+W_n^2}}$$  

'밑바닥부터 시작하는 딥러닝' 책에서는 손실 함수(E)에 $$ {\frac{\lambda}{2}W^{2}} $$ 더했다.

$$\widetilde{E}(\mathbf{W})=E(\mathbf{W})+\frac{\lambda}{2}\mathbf{W}^2$$

경사 하강법에 가중치 감소를 적용한 새로운 비용 함수:[^14]  
(개별 가중치 $$w_i$$를 업데이트 할 경우에 대한 수식)

$$ w_i \leftarrow w_i-\eta\frac{\partial E}{\partial w_i}-\eta\lambda w_i $$

큰 가중치에 페널티를 주고 효과적으로 모델을 제한한다.

- $${\eta}$$: 학습률<sup>learning rate</sup>  
- $${\frac{\partial E}{\partial w_i}}$$: 원소의 편미분
- $${\lambda}$$: 정규화 파라미터

---

검증 데이타<sup>Validation Set</sup>: 하이퍼 파라미터 전용 확인 데이타  
'밑바닥부터 시작하는 딥러닝' 책에서는,

- Learning Rate($${\eta}$$): $$0.001$$ ~ $$0.01$$
- Weight Decay($${\lambda}$$): $$10^{-8}$$ ~ $$10^{-6}$$

## Keras
- Keras의 `input_dim`은 `input_shape`, x의 갯수
- Keras의 Dense = 어파인<sup>Affine</sup> = Fully Connected(fc) Layer

## CNN

$$ OH = {\frac {H+2P-FH}{S}} + 1 $$  
$$ OW = {\frac {W+2P-FW}{S}} + 1 $$  
입력 크기(H,W), 필터 크기(FH, FW), 출력 크기(OH,OW), 패딩 P, 스트라이드 S

im2col 입력 데이타를 필터링(가중치 계산)하기 좋게 전개

층이 깊어지면 더 복잡하고 추상화된 정보 추출

1. 엣지 반응
2. 텍스처 반응
3. 복잡한 사물 일부에 반응

사물의 의미를 이해하도록 변화

### VGG16

<img src="https://www.cs.toronto.edu/~frossard/post/vgg16/vgg16.png" width="100%" />[^19]

- AlexNet과 유사한 단순 구조로 인기
- 3x3 작은 필터를 여러번 거쳐 큰 필터 대체 효과

## 층을 깊게 하는 이유

- 적은 매개 변수로 같은(혹은 그 이상) 수준의 표현력 달성
- 5x5 필터는 3x3 필터 2회로 대체 가능. 매개 변수 수가 줄어든다.  
- 층이 깊어지면 표현력<sup>Representaion</sup>이 좋아진다.

## RNN

<img src="/images/2017/blstm-2dcnn.png" width="400" />
BLSTM과 2DCNN으로 했을때 문장 분류 결과가 가장 좋았다는 중국 논문[^20]에 따르면 SST-2(Stanford Sentiment Treebank에 중립 리뷰 제거) 정확도가 89.5% 라고


# References

[^1]: <https://www.mathsisfun.com/algebra/scalar-vector-matrix.html>
[^2]: <https://sebastianraschka.com/Articles/2015_singlelayer_neurons.html>
[^3]: <https://www.quora.com/What-is-the-difference-between-a-*cost-function*-and-a-*loss-function*-in-machine-learning>
[^4]: <https://docs.moodle.org/23/en/Using_TeX_Notation_2>
[^5]: <http://blog.zabarauskas.com/backpropagation-tutorial/>
[^6]: <http://selfdrivingcars.mit.edu/>
[^7]: <http://nmhkahn.github.io/NN>
[^8]: <http://blog.naver.com/mykepzzang/220072089756>
[9]: http://mccormickml.com/2014/03/04/gradient-descent-derivation/
[10]: https://www.reddit.com/r/mlclass/comments/l0ae8/can_somebody_explain_why_12m_was_added_in_the/?st=ixxlvm11&sh=1eca6ff1
[^11]: Numerical Methods for Engineers, Steven C. Chapra, McGraw Hill
[^13]: <https://shuuki4.wordpress.com/2016/01/13/batch-normalization-%EC%84%A4%EB%AA%85-%EB%B0%8F-%EA%B5%AC%ED%98%84/>
[^14]: <http://stats.stackexchange.com/a/31334>
[^15]: <https://tensorflow.blog/2016/12/27/%EC%97%AD%EC%A0%84%ED%8C%8C-%EC%A7%81%EC%A0%91-%EC%A7%9C%EB%B4%90%EC%95%BC-%ED%95%98%EB%82%98%EC%9A%94/>
[^16]: <http://sebastianruder.com/optimizing-gradient-descent/>
[^17]: <http://cs231n.github.io/neural-networks-3/>
[^18]: <http://cs231n.github.io/neural-networks-1/>
[^19]: <https://www.cs.toronto.edu/~frossard/post/vgg16/>
[^20]: [Text Classification Improved by Integrating Bidirectional LSTM with Two-dimensional Max Pooling](https://arxiv.org/abs/1611.06639v1)
