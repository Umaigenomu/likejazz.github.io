---
layout: post
title: NumPy와 C++ Extensions의 성능 비교
tags: [General Programming]
---

<div class="message">
파이썬은 놀라운 생산성을 발휘하는 언어다. 하지만 성능 문제가 항상 발목을 잡는다. 이 문제를 극복하는 방법으로 일반적으로 C Extension을 작성하는 방법이 권장되며, 여기서는 표준 편차를 구하는 함수를 작성하여 순수 파이썬의 성능과 NumPy, 각종 C++ Extensions의 성능을 비교해 보도록 한다.
</div>

*2018년 5월 12일 초안 작성*

<!-- TOC -->

- [내용](#내용)
    - [Python](#python)
    - [NumPy](#numpy)
    - [C++ Extension](#c-extension)
    - [Cython](#cython)
    - [pybind11](#pybind11)
- [실험 결과](#실험-결과)
- [결론](#결론)
- [참고](#참고)

<!-- /TOC -->

## 내용
### Python
표준 편차를 구하는 파이썬 코드는 아래와 같이 작성할 수 있다.

```python
def mean(lst):
    return sum(lst) / len(lst)

def standard_deviation(lst):
    m = mean(lst)
    variance = sum([(value - m) ** 2 for value in lst])
    return math.sqrt(variance / len(lst))
```

### NumPy
NumPy로는 매우 간단하게 한 줄로 처리 가능하다. 

```python
np.std(lst)
```

NumPy를 사용하면 코드가 간단해지고, 일반적으로 NumPy는 C로 최적화한 매우 효율적인 라이브러리로 알려져 있으나 NumPy는 싱글 코어와 대형 배열에 최적화된 라이브러리라는 한계가 존재한다. 실제로 배열의 크기가 100개 이내인 경우 NumPy는 순수 파이썬 구현 보다도 오히려 낮은 성능을 보인다.

### C++ Extension
여기서는 C++로 Extension을 작성하여 성능을 최적화 해보도록 한다. C++로 표준 편차를 구하는 코드는 아래와 같이 작성했다.

```c++
double standardDeviation(std::vector<double> v) {
    double sum = std::accumulate(v.begin(), v.end(), 0.0);
    double mean = sum / v.size();

    double squareSum = std::inner_product(v.begin(), v.end(), v.begin(), 0.0);
    return sqrt(squareSum / v.size() - mean * mean);
}
```

C++을 파이썬과 연동 하려면 계산 코드 외에도 wrapper 함수를 작성해야 한다.

```c++
static PyObject *std_standard_dev(PyObject * self, PyObject * args) {
    PyObject * input;
    PyArg_ParseTuple(args, "O", &input);

    int size = PyList_Size(input);

    std::vector<double> list;
    list.resize(size);

    for (int i = 0; i < size; i++) {
        list[i] = PyFloat_AS_DOUBLE(PyList_GET_ITEM(input, i));
    }

    return PyFloat_FromDouble(standardDeviation(list));
}
```

이 wrapper 함수는 파이썬 리스트를 받아와 값을 하나씩 끄집어 낸 다음 `std::vector`에 담아 C++ 함수에 전달하는 역할을 한다. wrapper에는 이외에도 여러가지 처리를 위한 boilerplate 코드가 들어간다. 매우 번거로운 작업이고 나 또한 wrapper 코드를 작성하며 사소한 실수로 무수한 컴파일 오류를 맞이 해야만 했다. 번거로운 작업이다.

### Cython
Cython은 CPython과 이름이 비슷하여 혼동될 수 있으나 전혀 다르다. 원래의 목적은 Pyrex 기반의 파이썬 코드를 작성하면 이를 C로 변환해 성능을 최적화 해주는 컴파일러다. 그러나 외부 C 라이브러리를 랩핑 하는데도 매우 유용하다. 아울러 C 뿐만 아니라 C++도 네이티브로 지원한다. 여기서는 C++ 함수를 랩핑하는 용도로 사용했으며, 아래와 같이 코드를 작성했다.

```python
cdef extern from "std.h":
    double standardDeviation(vector[double])

def standard_dev(lst):
    # This pre-conversion has some performance improvements.
    cdef vector[double] v = lst

    return standardDeviation(v)
```

헤더를 읽어 함수를 정의한 다음 파이썬 스타일의 함수에서 C++ 함수의 리턴값을 전달한다. C++과 파이썬이 오묘한 형태로 결합되어 있다. 이 부분은 장점이자 단점이 될 수 있는데 기존 파이썬의 함수를 그대로 사용할 수 있는 장점이 있는 반면 기존 파이썬 함수의 낮은 성능 또한 그대로 반영된다. 상식적으로 파이썬 코드가 단순히 C 코드로 변환되었다고 성능이 개선되진 않는다. (물론 약간의 개선 효과는 있다.) `cdef`를 이용해 변수를 C/C++ 네이티브로 선언하고 주요 계산 알고리즘은 외부 C/C++ 함수로 따로 작성해서 랩핑해야 진정한 성능 개선 효과를 얻을 수 있다.

원래 Cython은 파이썬의 리스트를 C++ `std::vector`로 자동으로 컨버팅 하지만 여기서는 성능을 개선하고자 상단에 컨버팅을 직접 정의했다. 직접 작성한 컨버팅 함수는 14줄이 필요했으나 여기서는 단 한 줄로 가능하다.

### pybind11
pybind11는 "Seamless operability between C++11 and Python"라는 모토로 최근에 등장한 C++ 전용 헤더 라이브러리다. ctypes를 사용할 수 있는게 C의 잇점이라면 pybind11은 C++에서만 사용이 가능하다. 파이썬 연동을 마치 C++ 코드의 연장선 처럼 부드럽게<sup>seamless</sup> 할 수 있다. cmake도 잘 지원하여 빌드나 IDE 연동도 편리하다. 앞서 Cython이 파이썬 중심의 라이브러리 였다면 pybind11는 C++ 중심의 라이브러리라 할 수 있다.

랩핑 코드 또한 파이썬으로 작성했던 Cython과 달리 아래와 같이 C++로 작성한다.

```c++
PYBIND11_MODULE(stdpy, m) {
    m.def("standard_dev", &standardDeviation);
}
```

Cython과 마찬가지로 오토 컨버팅을 지원하며 헤더를 include 하면 나머지는 자동으로 처리한다.

```c++
#include <pybind11/stl.h>
```

C++에 최적화 되어 있으므로 성능이 매우 좋을 것 같지만 아쉽게도 Cython 보다는 못한 성능을 보여준다. 특히 오토 컨버팅은 편리하지만 별도로 제어할 수 없으며, 이로 인한 성능 저하가 뚜렷하다. 

## 실험 결과
최대 1만개까지 배열의 표준 편차를 구하는 성능 테스트 결과는 아래와 같다.

<img src="https://user-images.githubusercontent.com/1250095/39954390-9a5fed02-55f9-11e8-842b-b430bb2c3d5b.png" width="70%" />

앞서 잠깐 언급했지만, 기대를 모았던 NumPy의 성능은 그다지 높지 않다. 이는 대형 배열에 최적화 되어 있기 때문이며 이후에 이어지는 대형 배열의 성능 테스트에선 좋은 성능을 확인할 수 있다.

C++ 구현은 직접 구현하든 Cython, pybind11을 사용하든 어느쪽이든 좋은 성능을 보여준다. 그러나 일반적으로 직접 wrapper를 작성하는 쪽이 가장 성능이 좋으며 오토 컨버팅을 지원하는 Cython과 pybind11는 그 만큼의 성능 저하가 있다. 특히 pybind11 쪽의 성능 저하가 뚜렷하다.

다음으로 5만개까지 대형 배열의 성능 테스트 결과는 아래와 같다.

<img src="https://user-images.githubusercontent.com/1250095/39954391-9a870180-55f9-11e8-9758-4b5650429e6e.png" width="70%" />

먼저 순수 파이썬으로 계산한 결과는 다른 것과 비교가 불가능 할 정도로 너무 느려 아예 비교에서 제외했다. 여기서는 NumPy, C++, Cython, pybind11만 비교했는데 앞서 다소 실망스런 모습을 보였던 NumPy가 좋은 모습을 보여준다. 약 1만개를 넘어서면서 부터 가장 좋은 성능을 보이며, 배열의 크기가 늘어나도 전체 계산 속도에는 크게 영향을 끼치지 않는 모습을 확인할 수 있다. 대형 배열에 최적화된 C 라이브러리의 진가가 드러나는 순간이다. 직접 구현한 C++이 그 다음을 차지하며, Cython, pybind11 순이다.

## 결론
일반적으로 NumPy만 잘 사용해도 충분한 성능을 얻을 수 있다. 그러나 NumPy에는 결정적인 한계가 있는데 싱글 코어에 최적화 되어 있다는 점이다. 애초에 GIL로 인해 멀티 쓰레드가 유명무실한 파이썬과 마찬가지로 NumPy 또한 싱글 코어에 최적화 되어 있는 한계가 있으며, 멀티 코어를 제대로 활용하기 위해선 C/C++로 쓰레드 프로그래밍을 해야 한다. 이 때문에 텐서플로를 포함한 대부분의 딥러닝 프레임워크 또한 C++에서 멀티 코어를 활용하여(이 글에선 언급하지 않았지만 SWIG로 파이썬과 연동하여) 계산을 수행하는 방식으로 구현되어 있다.

또한 직접 모든 wrapper를 작성하는 일은 너무 많은 고난이 뒤따르기 때문에 성능을 약간 타협하여 Cython 또는 pybind11를 택하는 편이 최적의 선택이라 생각한다. C++ 연동 방식은 pybind11가 좀 더 우아한 편이지만 오토 컨버팅의 성능 이슈는 하루빨리 해결되어야 할 과제다.

## 참고
이 문서에서 사용한 표준 편차를 구하는 함수와 최초 C++ 구현은 [Speeding up Python and NumPy: C++ing the Way](https://medium.com/coding-with-clarity/speeding-up-python-and-numpy-c-ing-the-way-3b9658ed78f4)를 참조했으며 이를 fork 하여 C++ wrapper를 개선하고 Cython, pybind11 바인딩을 추가했다. 전체 코드는 아래 깃헙에 올려 두었다.

[likejazz/PythonCExtensions - GitHub](https://github.com/likejazz/PythonCExtensions)
