---
layout: wiki 
title: Python
last-modified: 2020/03/01 12:23:21
---

<!-- TOC -->

- [Pythonic way](#pythonic-way)
    - [set, list, tuple](#set-list-tuple)
    - [List Comprehension](#list-comprehension)
        - [Nested Loops](#nested-loops)
        - [Other Comprehensions](#other-comprehensions)
- [Books](#books)
    - [고성능 파이썬 <sub>2013, 2016</sub>](#고성능-파이썬-2013-2016)
    - [뇌를 자극하는 파이썬 3 <sub>2016</sub>](#뇌를-자극하는-파이썬-3-2016)
- [Links](#links)

<!-- /TOC -->

# Pythonic way
아래 내용들은 『파이썬 코딩의 기술 <sub>2015, 2016</sub>』에 나오는 내용들이다.  
[Effective Python 내용 정리](https://github.com/shoark7/Effective-Python)

- map과 filter 대신 list comprehension을 사용하라
- range 보다는 enumerate를 사용하라
- def 에서 `*args`를 사용하면 함수에서 가변 개수 <sup>variable argument</sup>의 위치 인수를 받을 수 있다.
- class에 필요한 다른 생성자를 정의하려면 `@classmethod`를 이용하라
- `super`로 부모 함수를 초기화 하라
- 파이썬의 언어 후크<sup>language hook</sup>를 사용하면 시스템을 연계하는 범용 코드를 쉽게 만들 수 있다.
    - `__getattr__`, `__getattribute__`, `__setattr__`
- `__doc__`이라는 속성에 접근하면 파이썬 프로그램 자체에 포함된 docstring을 추출할 수 있다.
- 최적화 하기 전에 `Profile`을 이용해 프로파일 하라

(Effective Python, 2015)

추가:  

28: 커스텀 컨테이너 타입은 `collections.abc`의 클래스를 상속받게 만들자

42: `functools.wraps`로 함수 데코레이터를 정의하자

자료형  
리스트의 시작 부분에서 아이템을 삽입하거나 삭제하는 연산에는 선형적 시간 <sup>linear time</sup>이 걸리므로 deque의 일정한 시간보다 훨씬 느리다.

이진 검색은 `bisect_left` 같은 효율적인 함수 이용  
`i = bisect_left(x, 991234)`

`itertools`는 이터레이터를 구성하거나 이터레이터와 상호 작용하는데 유용한 함수를 제공한다.  
`product`: 이터레이터에 있는 아이템들의 카테시안 곱을 반환한다.  
`permutations`, `combinations` 포함

## set, list, tuple
```python
a = {1, 2, 3}  # set
b = [1, 2, 3]  # list
c = (1, 2, 3)  # tuple
``` 
**List** is mutable and **tuples** is immutable.

## List Comprehension
### Nested Loops
```python
flattened = []
for row in matrix:
    for n in row:
        flattened.append(n)
```

Here’s a **list comprehension** that does the same thing:
```python
flattened = [n for row in matrix for n in row]
```

### Other Comprehensions
```python
flipped = {}
for key, value in original.items():
    flipped[value] = key
```

That same code written as a **dictionary comprehension**:
```python
flipped = {value: key for key, value in original.items()}
```

# Books
## 고성능 파이썬 <sub>2013, 2016</sub>
컴퓨터 시스템의 기본:  
암달의 법칙 <sup>Amdahl's law</sup>: 멀티 코어에서 작동하도록 설계된 프로그램 일지라도 하나의 코어에서 실행되어야 하는 루틴이 존재하고, 더 많은 코어를 투입해도 병목으로 작용한다는 법칙.

예를 들어, 1분이 소요되는 설문 조사를 100명을 대상으로 했을때, 조사원이 2명이라면 50분에 끝낼 수 있겠지만 조사원이 200명이라도 1분 이내로 끝낼 수는 없다. 여기서 1분의 루틴이 존재한다. p.24

파이썬의 성능:  
1. 파이썬 객체가 메모리에 최적화된 상태로 저장되지 않는다. 메모리를 자동으로 할당/해제하는 GC를 사용하는데, 이는 CPU 캐시에 데이터를 전송하는데 영향을 미치는 메모리 단편화를 일으킨다.
1. 동적 타입을 사용하며, 컴파일 되지 않는다. 이 문제를 극복하는 방법 중에는 Cython이 대표적이다.
1. GIL: CPU의 병렬 연산이 불가능하다. 이 문제는 멀티쓰레드가 아닌 멀티프로세스(mulprocessing 모듈 사용)를 사용해서 회피할 수 있다.

p.33

파이썬을 쓰는 이유:  
표현력이 좋고 배우기 쉽다. 파이썬 라이브러리는 타 언어로 작성된 도구를 감싸서 다른 시스템도 쉽게 호출할 수 있도록 하고 있다. 예를 들어 scikit-learn은 C로 작성된 liblinear, libsvm 사용. NumPy는 BLAS와 또 다른 C, Fortran 라이브러리 포함.

프로파일링:  
데코레이터(자바의 어노테이션)를 활용한 시간 측정. line_profiler가 좋아 보이지만 최근 버전에서 잘 동작하지 않는듯 하다. (확인 필요)

더 효율적인 탐색:  
팀 정렬은 다양한 정렬 알고리즘을 활용하여 주어진 데이터에 어떤 알고리즘을 적용하는 것이 최선인지를 추측하는 휴리스틱을 사용한다(더 자세히 말하자면, 삽입 정렬과 병합 정렬 알고리즘을 조합해서 사용한다)  
p.90

<img src="https://user-images.githubusercontent.com/1250095/68547287-24716880-0423-11ea-9ade-0840a4a8a2d9.jpg" width="70%">

리스트의 경우 꽉 찼을때 리사이징을 한다고 언급한다.

해시 테이블에서 데이터가 얼마나 균등하게 분포되어 있는지를 로드 팩터라 하며, 해시 함수의 엔트로피와 관련 있다. p.106 최소 충돌일때 당연히 엔트로피는 최대가 된다.

Dict의 최소 크기는 8이다. 이 크기는 50,000까지는 4배씩 증가하고 그 뒤로는 2배씩 증가한다. (위 사진은 List이므로 혼동 x)

`8, 32, 128, 512, 2048, 8192, 32768, 131072, 262144, ...`

많은 항목이 삭제되면 크기가 줄어들 수도 있다.

파이썬의 `range()`는 값을 리턴하는게 아니라 제네레이터를 리턴한다. p.120 그래서 메모리를 절약할 수 있다.

JIT vs. AOT:  
미리 컴파일 하는 방식 <sup>ahead of time</sup>으로 Cython, 적절한 때에 컴파일 하는 방식 <sup>just in time</sup>으로 Numba, PyPy가 있따. GCC, Clang등은 당연히 AOT 방식.

이 책은 multiprocessing 모듈에 대해 많은 부분을 할애하고 있다.

바이트와 유니코드:  
파이썬 2.7은 모든 유니코드가 같은 수의 바이트를 사용한다. PEP 393 덕분에 파이썬 3.3 이상은 유연한 유니코드 표현을 사용한다. 파이썬 3.3에서는 문자열에 속한 문자들의 범위를 관찰해서 가능하다면 낮은 수준의 문자(ASCII등)는 더 적은 바이트를 사용하도록 한다. p.361

## 뇌를 자극하는 파이썬 3 <sub>2016</sub>

가변 매개 변수 <sup>arbitrary argument list</sup>

```python
def merge_string(*text_list):
    result = ''
    for s in text_list:
        result += s
    return result
merge_string('A','B','C')
```

`*`는 포인터가 아님. 튜플로 정의된다. 타입 확인 가능.

함수 안의 함수: 중첩 함수 <sup>nested function</sup>  
자신이 소속된 함수의 매개변수에 접근이 가능하다.

# Links
Extending with C++
- [Extending with C++](http://dev.likejazz.com/post/174904974036/extending-with-c): 빌드 실패 사례
- [Python, Extending with C](http://dev.likejazz.com/post/40095584513/python-extending-with-c): 단순 구현
- [NumPy와 C++ Extensions의 성능 비교](http://docs.likejazz.com/python-numpy-extensions/): Cython, pybind11 구현

코딩 가이드
- PEP 8 [한글 설명](https://spoqa.github.io/2012/08/03/about-python-coding-convention.html)
- [Google Python Style](https://google.github.io/styleguide/pyguide.html)
