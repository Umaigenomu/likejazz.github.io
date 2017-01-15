---
layout: post
title: 밑바닥부터 시작하는 딥러닝
invisible: true
---

<div class="message">
..
</div>

*2017년 1월 15일 초안 작성*

## Numpy
{% highlight python %}
A = np.array([1,2,3,4])
print (type(A)) # 변수 타입
<type 'numpy.ndarray'>
print (A.dtype) # 원소 타입
int64
print (A.shape) # 형상
(4,)
A.ndim # 배열의 차원
2
{% endhighlight %}

`*` in Numpy is element-wise multiplication.  
`np.dot` is matrix multiplication.

<img src="https://www.mathsisfun.com/algebra/images/scalar-vector-matrix.gif" width="400" />
[^1]

[^1]: <https://www.mathsisfun.com/algebra/scalar-vector-matrix.html>

`np.eye(3)` is `[[1,0,0],[0,1,0],[0,0,1]]`  

차원이 다르면 broadcast

### np.dot
<img src="/images/2017/npdot.png" width="400" />

np.arrange 확인 필요(!)

<img src="https://sebastianraschka.com/images/blog/2015/singlelayer_neural_networks_files/perceptron_schematic.png" />[^2]

[^2]: <https://sebastianraschka.com/Articles/2015_singlelayer_neurons.html>

퍼셉트론의 구조. 활성화 함수로 계단 함수를 사용. 이를 다른 함수로 변경하는 것이 신경망의 핵심  
활성화 함수는 비선형(시그모이드등)이어야 한다. 선형은 은닉층이 없는 네트워크로 표현가능하므로 의미가 없다.

8개 은닉층으로 구성한 XOR 신경망 구조
<img src="/images/2017/neural-network.png" width="500" />

활성화 함수 종류
ReLU, tanh, sigmoid, softmax(다중 분류)

자연로그의 역함수 $$ e^x = exp $$  
자연상수 $$ e = 2.7182 $$

Keras의 input_dim은 input_shape, x의 갯수로 정함

cost and loss functions are synonymous[^3]

[^3]: <https://www.quora.com/What-is-the-difference-between-a-*cost-function*-and-a-*loss-function*-in-machine-learning>

MSE: Mean Squared Error 정답과의 거리 제곱. 표준 편차와 유사  
CEE: Cross Entropy Error 정답만 보는 자연로그 수식

정확도는 step이 길지만 손실 함수는 매우 민감하게 반응한다. 따라서 손실 함수를 기준으로 해야 한다. step function을 활성화 함수로 사용하지 않는 것과 동일

시그모이드의 미분(접선)은 어느 장소라도 0이 되지 않기 때문에 신경망 학습에 유리

수치 미분: 아주 작은 차분으로 미분을 구함
$$ (f(x+h) - f(x-h)) / 2*h $$
변수가 여럿인 함수에 대한 미분을 편미분

중앙차분: http://blog.naver.com/mykepzzang/220072089756

andrew ng의 머신러닝 강좌를 보면 cost function으로 MSE의 1/2을 취하는데,
http://mccormickml.com/2014/03/04/gradient-descent-derivation/
자세한 소개가 있다. one half mean squared error
https://www.reddit.com/r/mlclass/comments/l0ae8/can_somebody_explain_why_12m_was_added_in_the/?st=ixxlvm11&sh=1eca6ff1

확률적 경사 하강법 stochastic gradient descent SGD

기울기 gradient = 모든 편미분을 벡터로 정리

이전에 가중치 매개 변수에 대한 손실함수 기울기는 수치 미분을 사용해 구하고 기울기의 10% 만큼 이동하도록 구현했음