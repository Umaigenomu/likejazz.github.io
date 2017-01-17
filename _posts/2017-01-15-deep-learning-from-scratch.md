---
layout: post
title: 딥러닝 용어 정리
invisible: true
---

*2017년 1월 15일 초안 작성*

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

---

<img src="https://www.mathsisfun.com/algebra/images/scalar-vector-matrix.gif" width="400" />[^1]

<img src="/images/2017/greek-letters.png" width="400" />[^4]

## 신경망
<img src="/images/2017/neuron.png" />[^6]  
퍼셉트론은 활성화 함수로 계단 함수 사용. 이를 다른 함수로 변경하는 것이 신경망의 핵심. 활성화 함수는 비선형(시그모이드등)이어야 한다. 선형은 은닉층이 없는 네트워크로 표현가능하므로 의미가 없다.

<img src="/images/2017/neural-network.png" width="500" />
8개 은닉층으로 구현한 XOR 신경망 구조에서 학습 가능 파라미터는 은닉층 24개(W 16, b 8), 출력층 9개(W 8, b 1). Keras에서는 `model.summary()`로 확인 가능.

## 활성화 함수<sup>Activation Function</sup>
- ReLU, He 초기값(표준편차 $${\sqrt{\frac{n}{2}}}$$)
<img src="http://nmhkahn.github.io/assets/NN/relu.jpg" />[^7]
- Sigmoid $${\sigma}(x) = \frac{1}{1 + e^{-x}}$$ Xavier 초기값(표준편차 $${\frac{1}{\sqrt{n}}}$$)
<img src="http://nmhkahn.github.io/assets/NN/sigmoid.jpg" />[^7]
- $$tanh(x) = 2{\sigma}(2x) -1$$
<img src="http://nmhkahn.github.io/assets/NN/tanh.jpg" />  
시그모이드와 달리 함수값이 zero-centered 되어 있다.
- Softmax 다중 분류

---

- 자연로그의 역함수 $$ e^x = exp(x) $$  
- 자연상수 $$ e = 2.7182 $$

---

Keras의 input_dim은 input_shape, x의 갯수

## 손실 함수<sup>cost or loss or error functions[^3]</sup>

- MSE<sup>Mean Squared Error</sup> 정답과의 거리 제곱. 표준 편차와 유사  
  - $$y_k$$: 신경망 출력
  - $$t_k$$: 정답 레이블
  - $$k$$: 학습 데이타 수

$$E={\frac{1}{k}}{\sum_{k}}(y_k-t_k)^2$$

앤드류 응의 머신러닝 [강좌를 보면 손실 함수로 MSE의 1/2][10]을 취하는데 [이에 대한 자세한 소개][9]. 계산을 쉽게 하기 위함이며 MSE 앞에 One Half를 붙인 One Half Mean Squared Error.

- CEE<sup>Cross Entropy Error</sup>

$$E=-{\sum_{k}t_k{\log{y_k}}}$$

원-핫 인코딩<sup>one-hot encoding</sup>일때는 정답의 로그 그래프

손실 함수로 학습하는 이유는 정확도는 step이 길지만 손실 함수는 매우 민감하게 반응. 활성화 함수로 step function을 사용하지 않는 것과 동일.

시그모이드의 미분(접선)은 어느 장소에도 0이 되지 않기 때문에 신경망 학습에 유리

## 미분
- 수치 미분: 아주 작은 차분으로 미분을 구함  
- 편미분: 변수가 여럿인 함수에 대한 미분
- 중앙차분<sup>centered finite-divided-difference</sup>

$$ f^{'}(x){\approx}{\frac {f(x+h)-f(x-h)}{2h}} $$

[^8]

<img src="/images/2017/centered-finite-divided-difference.png" width="500" />[^11]


## 확률적 경사 하강법<sup>SGD, Stochastic Gradient Descent</sup>

- 기울기<sup>gradient</sup>  
모든 편미분을 벡터로 정리

이전에 가중치 매개 변수에 대한 손실함수 기울기는 수치 미분을 사용해 구하고 기울기의 10% 만큼 이동하도록 구현했음

수치미분의 delta 값은 0.0001로 지정. 최종값은 1일때 기울기이므로 1보다 작도록. 범위가 클수록 해석적 미분의 값과 많이 차이남

cost function은 convex function 형태여야 한다.

wilml의 용어 정리 http://www.wildml.com/deep-learning-glossary/

## Optimization
- 확률적 경사 하강법<sup>SGD, Stochastic Gradient Descent</sup>
- Momentum
- AdaGrad
- Adam
cs231n 데모

## Gradient Vanishing
- 표준편차1 정규분포: 활성화값 0,1에 다가감
- 표준편차stddev를 0.01로 한 정규분포: 가운데 몰림

## 배치 정규화<sup>batch nomarlization</sup>

fc와 ReLU 사이에 bn(batch norm 이 명칭이 맞나 확인) 계층 삽입. 데이타 분포가 평균 0, 분산 1이 되도록 정규화
수식
배치정규화 효과 그래프: 학습 속도를 높인다

## 가중치 감소<sup>weight decay</sup>
오버피팅을 줄이기 위해 큰 가중치에 대해 페널티  
L2 정규화 법칙: 각 원소의 제곱을 더한것 (제곱근) $$ W = {\sqrt{W_1^2+W_2^2+...+W_n^2}} $$
가중치 각각의 손실 함수(E)에 $$ {\frac{\lambda}{2}W^{2}} $$ 더한다.
zero mean Gaussian prior

$$\widetilde{E}(\mathbf{w})=E(\mathbf{w})+\frac{\lambda}{2}\mathbf{w}^2$$

큰 가중치를 처벌하고 효과적으로 모델을 제한합니다. 

cost or error or loss function:
E(w)

경사 하강법의 기울기 방향 변화  
$$ w_i \leftarrow w_i-\eta\frac{\partial E}{\partial w_i}$$

Applying gradient descent to this new cost function we obtain:  
$$ w_i \leftarrow w_i-\eta\frac{\partial E}{\partial w_i}-\eta\lambda w_i. $$

- $${\eta}$$: 학습률<sup>learning rate</sup>  
- $${\frac{\partial E}{\partial w_i}}$$: 원소의 편미분
- $${\frac{\partial E}{\partial W}}$$: 각 원소는 각각의 원소의 편미분
- $${\lambda}$$: 정규화 파라미터, 람다는 원래 비용 함수 E를 가중치 벌점을 어떻게 교환할지 결정

http://stats.stackexchange.com/a/31334

드롭아웃

검증 데이타 validation set: 하이퍼파라미터 전용 확인 데이타
본문의 경우 learning rate: 0.001 ~ 0.01, weight decay: 10^-8 ~ 10^-6
그렇다면 weight decay 값은 결국 lambda 값인가 보다


## CNN
$$ OH = {\frac {H+2P-FH}{S}} + 1 $$
$$ OW = {\frac {W+2P-FW}{S}} + 1 $$
입력 크기(H,W), 필터 크기(FH, FW), 출력 크기(OH,OW), 패딩 P, 스트라이드S

## CNN Numpy
x = np.random.rand(10,1,28,28)
x.shape
x[0].shape
x[1].shape
x[0,0]

Keras의 Dense = Affine = Fully Connected Layer

im2col 입력 데이타를 필터링(가중치 계산)하기 좋게 전개

LRN local response normalization 국소적 정규화를 실시하는 계층
bn 인가?

층이 깊어지면 더 복잡하고 추상화된 정보가 추출
1: 엣지 반응
2: 텍스처 반응
3: 복잡한 사물 일부에 반응
사물의 의미를 이해하도록 변화

## 층을 깊게 하는 이유
이론적 근거가 많이 부족
- 매개 변수 수가 줄어든다. 적은 매개변수로 같은(혹은 그 이상) 수준의 표현력 달성
5x5 필터는 3x3 필터 2회로 대체 가능. 매개변수가 적다.
층이 깊어지면 표현력(representaion)이 좋아진다.

VGG16 AlexNet과 유사한 단순 구조로 인기 높다.
3x3 작은 필터를 여러번 거쳐 큰 필터 대체 효과를 준다.

GPU 대량 단일 곱센-누산 수행

R-CNN 사물 검출
FCN 한 번의 forward 처리로 모든 필셀 클래스 분류. 분할 segmentation
NIC Neural Image Caption: CNN 이미지 특징 추출 RNN에서 캡션 생성
DCGAN 침실 이미지 생성
DQN 강화학습. Q학습에서는 최적 행동 가치 함수로 최적인 행동
영상 프레임만을 이용해서 조이스틱 조작 제어. 모든 게임에 범용 적용 가능. 딥마인드에서 진행한 연구


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