---
layout: post
title: Intersection of two Sets optimized way in Java
---

<div class="message">
중복 제거를 위해 250개의 문서를 상호 비교할 경우 총 31,125번의 비교를 진행하게 된다. 이에 따른 CPU 비용이 상당히 높은데 이를 보다 최적화하여 개선할 수 있는 방안을 찾아본다.
</div>

## 내용

두 문서의 유사도를 계산하는 [w-shingling 알고리즘](http://en.wikipedia.org/wiki/W-shingling)은 A/B 두 문서의 슁글(shingle) 사이즈를 아래와 같이 간단한 교집합(intersection)과 합집합(union)으로 유사도를 표현한다.

![w-shingling](http://upload.wikimedia.org/math/5/7/c/57c09a4c79a15ebfb940af31b0594059.png)

자카드 계수(Jaccard coefficient) 정의와도 동일한데 따라서 교집합(intersection)을 빠르게 계산하는 것이 성능 개선의 핵심이다. 이 부분은 약 3만회 이상 비교를 진행하는 핫스팟(Hot Spot)이고 따라서 약간의 수치 개선 만으로도 전체적인 성능 개선 효과가 크기 때문이다.

자바에서 [두 Set 간 교집합(intersection)을 계산하는 방법](http://www.leveluplunch.com/java/examples/intersection-of-two-sets/)은 여러가지가 있으며, 이를 이용해 다양한 교집합을 구해보고 성능을 측정하기로 한다.

성능 측정은 튀는 값을 배제하기 위해 평균(average)이 아닌 중앙값(median)을 취하기로 한다. 중앙값 메소드는 [SO에 있는 코드](http://stackoverflow.com/a/11955900/3513266)를 참조하여 아래와 같이 작성했다.


{% highlight java %}
private static double median(long[] arr) {
    Arrays.sort(arr);
    double median;
    if (arr.length % 2 == 0)
        median = ((double) arr[arr.length / 2] +
                  (double) arr[arr.length / 2 - 1]
                 ) / 2;
    else
        median = (double) arr[arr.length / 2];
 
    return median;
}
{% endhighlight %}

### Straight up Java

기존 JDK 기본 라이브러리를 사용한 코드는 아래와 같다. 

{% highlight java %}
// JDK 기본 라이브러리
Set<Integer> intersection = new HashSet<Integer>(preSet);
intersection.retainAll(curSet);
intersectionSize = intersection.size();
{% endhighlight %}

`retainAll()` 메소드는 `java.util.Collection`에서 제공하는 JDK 기본 메소드이며 일치하는 Set을 남겨주는 역할을 한다. 즉, 교집합에 해당하는 만큼을 남기며 원본을 조작하므로 원본을 손실하지 않기 위해선 위와 같이 별도의 HashSet을 생성해 담아야 한다.

기존에는 이 기본 메소드를 사용했으며 100회 계산에 중앙값을 취해 109ms 응답 속도를 얻었다. 

### Guava

{% highlight java %}
// Guava
Set<Integer> intersection = Sets.intersection(curSet, preSet);
intersectionSize = intersection.size();
{% endhighlight %}

Guava에는 `Sets.intersection` 이라는 좋은 교집합 메소드를 제공하며 크기가 작은 Sets가 앞에 있을 경우 성능이 더 좋다.

> Note: The returned view performs slightly better when set1 is the smaller of the two sets. If you have reason to believe one of your sets will generally be smaller than the other, pass it first.

마찬가지로 100회 계산 중앙값은 58ms. 일반적으로 Guava 가 성능이 좋다고 알려져있으며 실제로 이 또한 기존 대비 80% 이상 성능 개선 효과가 있다.

### No intermediate HashSet

Guava만 해도 기존 보다 80% 이상 응답속도가 빨라졌지만 더 성능을 낼 수 있는 방법이 없을까 고민하던차 SO에서 좋은 질문을 발견했다.

[Efficiently compute Intersection of two Sets in Java?](http://stackoverflow.com/questions/7574311/efficiently-compute-intersection-of-two-sets-in-java)

게다가 친절하게 성능 비교를 직접 진행한 답변이 있었다. 본인이 친절히 성능 테스트를 진행하고 결과를 아래와 같이 제시했다.

{% highlight bash %}
Running tests for 1x1
IntersectTest$PostMethod@6cc2060e took 13.9808544 count=1000000
IntersectTest$MyMethod1@7d38847d took 2.9893732 count=1000000
IntersectTest$MyMethod2@9826ac5 took 7.775945 count=1000000
Running tests for 1x10
IntersectTest$PostMethod@67fc9fee took 12.4647712 count=734000
IntersectTest$MyMethod1@7a67f797 took 3.1567252 count=734000
IntersectTest$MyMethod2@3fb01949 took 6.483941 count=734000
Running tests for 1x100
IntersectTest$PostMethod@16675039 took 11.3069326 count=706000
IntersectTest$MyMethod1@58c3d9ac took 2.3482693 count=706000
IntersectTest$MyMethod2@2207d8bb took 4.8687103 count=706000
Running tests for 1x1000
IntersectTest$PostMethod@33d626a4 took 10.28656 count=729000
IntersectTest$MyMethod1@3082f392 took 2.3478658 count=729000
IntersectTest$MyMethod2@65450f1f took 4.109205 count=729000
...
{% endhighlight %}

`PostMethod`는 기존 JDK에서 제공하는 `retainAll()` 메소드를 뜻하며, `MyMethod1`은 No intermediate HashSet(이하 NIH) 방식이며 `MyMethod2`는 With intermediate HashSet 방식이다.

결과를 살펴보면 어떠한 경우에도 `retainAll()` 이 가장 느리고 NIH 방식이 With intermediate HashSet 에 비해 두 배 정도 빨라짐을 확인할 수 있다. 정확히 중간(intermediate) 단계가 추가된 만큼 더 느려짐을 추정할 수 있다.

이에 따르면 성능 개선의 핵심은 중간 단계 배제(No intermediate)였다. 즉, 교집합을 보관할 별도의 Set 을 만들지 않고 단순히 비교해서 수치만 뽑아낼 경우 `retainAll()` 보다 3배 이상, 중간 단계를 만들때보다도 2배 이상 빠른 응답 속도를 보여준다. 앞서 언급했듯 단순 비교일때는 무시할만한 수치일 수 있으나 현재 이 부분은 약 3만회 이상 비교를 진행하는 핫스팟(Hot Spot)이고 약간의 수치 개선만으로 전체적인 성능 개선 효과가 크기 때문이다.

코드는 아래와 같다.

{% highlight java %}
// No intermediate HashSet
public static int getIntersectionSize(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> a;
    Set<Integer> b;
    if (set1.size() <= set2.size()) {
        a = set1;
        b = set2;
    } else {
        a = set2;
        b = set1;
    }
    int count = 0;
    for (Integer e : a) {
        if (b.contains(e)) {
            count++;
        }
    }
    return count;
}
{% endhighlight %}
마찬가지로 100회 계산했고 이번에는 32ms에 불과하다. 가장 빠르다.

또한 Guava 와 마찬가지로 크기가 작은 Set 가 앞에 왔을때 성능이 더 좋다. 크기 비교를 하지 않고 단순 대입으로 진행해보니 조금 더 느린 41ms가 나왔다.

## 결론

교집합을 구하는 방식을 기존 JDK 방식에서 NIH 방식으로 바꿔 **기존 대비 340% 성능 개선 효과**를 얻을 수 있었다.

<table>
  <thead>
    <tr>
      <th>방식</th>
      <th>문서 수 / 비교횟수</th>
      <th>응답 속도</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>JDK</td>
      <td>250 / 31,125</td>
      <td>109ms</td>
    </tr>
    <tr>
      <td>Guava</td>
      <td>250 / 31,125</td>
      <td>58ms</td>
    </tr>
    <tr>
      <td>NIH</td>
      <td>250 / 31,125</td>
      <td><strong>32ms</strong></td>
    </tr>
  </tbody>
</table>