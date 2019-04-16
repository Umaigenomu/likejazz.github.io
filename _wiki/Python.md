---
layout: wiki 
title: Python
---

<!-- TOC -->

- [Pythonic way](#pythonic-way)
    - [String](#string)
    - [set, list, tuple](#set-list-tuple)
    - [List Comprehension](#list-comprehension)
        - [Nested Loops](#nested-loops)
        - [Other Comprehensions](#other-comprehensions)
    - [코딩 가이드](#코딩-가이드)
- [Extending with C++](#extending-with-c)

<!-- /TOC -->

# Pythonic way
- map과 filter 대신 list comprehension을 사용하라
- range 보다는 enumerate를 사용하라
- def 에서 `*args`를 사용하면 함수에서 가변 개수의 위치 인수를 받을 수 있다.
- class에 필요한 다른 생성자를 정의하려면 `@classmethod`를 이용하라
- `super`로 부모 함수를 초기화 하라
- 파이썬의 언어 후크<sup>language hook</sup>를 사용하면 시스템을 연계하는 범용 코드를 쉽게 만들 수 있다.
    - `__getattr__`, `__getattribute__`, `__setattr__`
- `__doc__`이라는 속성에 접근하면 파이썬 프로그램 자체에 포함된 docstring을 추출할 수 있다.
- 최적화 하기 전에 `Profile`을 이용해 프로파일 하라

(Effective Python, 2015)

## String
Python2와 Python3의 String 처리가 상이하다. 특히 파이썬은 특유의 unicode 인코딩 방식이 있는데, Python3에서는 훨씬 더 개선된 모습을 보여준다.

## set, list, tuple
```python
a = {1, 2, 3}  # set
b = [1, 2, 3]  # list
c = (1, 2, 3)  # tuple
``` 
**List** is mutable and **tuples** is immutable.

## List Comprehension
[참고](http://treyhunner.com/2015/12/python-list-comprehensions-now-in-color/)하여 아래에 정리했다.

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
first_letters = set()
for w in words:
    first_letters.add(w[0])
```

That same code written as a **set comprehension**:
```python
first_letters = {w[0] for w in words}
```

```python
flipped = {}
for key, value in original.items():
    flipped[value] = key
```

That same code written as a **dictionary comprehension**:
```python
flipped = {value: key for key, value in original.items()}
```

Python dictionary is [hash mapping or hash table](https://stackoverflow.com/a/114831/3513266).

## 코딩 가이드
- PEP 8 [한글 설명](https://spoqa.github.io/2012/08/03/about-python-coding-convention.html)
- [Google Python Style](https://google.github.io/styleguide/pyguide.html)

# Extending with C++
- [Extending with C++](http://dev.likejazz.com/post/174904974036/extending-with-c): 빌드 실패 사례
- [Python, Extending with C](http://dev.likejazz.com/post/40095584513/python-extending-with-c): 단순 구현
- [NumPy와 C++ Extensions의 성능 비교](http://docs.likejazz.com/python-numpy-extensions/): Cython, pybind11 구현
