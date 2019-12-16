---
layout: wiki 
title: OOP
---

<!-- TOC -->

- [다형성<sup>polymorphism</sup>](#다형성polymorphism)
- [캡슐화 <sup>encapsulation</sup>](#캡슐화-encapsulation)
- [추상화 <sup>Abstraction</sup>](#추상화-abstraction)
- [상속 <sup>Inheritance</sup>](#상속-inheritance)

<!-- /TOC -->

# 다형성<sup>polymorphism</sup>
서로 다른 유형의 개체에 단일 인터페이스를 제공한다. 다형성은 이름과 파라미터가 동일한 유형을 재정의할 수 있음을 의미한다.

* **Template** 다루는 형이 다르지만 함수 내부의 처리 방법이 같다.
    * Java에는 Generics가 있고, C++과 달리 하나의 컴파일된 코드를 만든다. 하지만 컴파일 타임에 오류를 체크할 수 있는 용도는 동일하다.
* **Overriding** 이름과 파라미터가 동일한 함수를 하위 클래스에서 재정의한다. 다형성과 관련 있다.

**Overloading** 이름은 같지만 파라미터가 다른 함수를 다른 방법으로 처리한다. 다형성과 관련 없다.
* C는 당연히 오버로딩이 없다.
* Go도 없다. 이름만으로 처리하기 때문이다. 하지만 편법으로 가능하다.

함수가 아닌 연산자를 재정의 하는 연산자 오버로딩<sup>operator overloading</sup>도 다형성과 관련 있다.

# 캡슐화 <sup>encapsulation</sup>
데이터와 메소드를 함께 제공하며, 데이터 직접 접근을 제한한다.

은닉화 <sup>information hiding</sup> 데이터를 외부에서 직접 접근하는게 아닌 함수를 통해서 접근한다.

# 추상화 <sup>Abstraction</sup>

# 상속 <sup>Inheritance</sup>