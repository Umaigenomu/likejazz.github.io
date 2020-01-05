---
layout: wiki 
title: HTML, CSS, JavaScript
last-modified: 2019/04/16
---

<!-- TOC -->

- [jQuery](#jquery)
    - [시작 함수](#시작-함수)
    - [event 제한](#event-제한)
- [CSS](#css)
    - [clear:both](#clearboth)

<!-- /TOC -->

# jQuery
## 시작 함수
jQuery의 시작 함수,
```
$(document).ready(function () {

});
```
간단하게 사용할 수 있는 형태를 함께 제공한다.
```
$(function () {

});
```
(모던 웹을 위한 JavaScript + jQuery 입문, 2011)

## event 제한
```
event.stopPropagation();
event.preventDefault();
```
는 간단히 `return false`로 대체 가능하다.

# CSS

새로운 레이아웃: `flex`
`column-width` 속성

`@media` 쿼리
pseudo_class
pseudo_elements

## clear:both
더 이상 의미 없는 div clear:both를 사용하지 말고 아래 clear fix 이용하라.
```
.clearfix:after {
	content: " ";
	display: block;
	clear: both;
}
```

Less 보다는 Sass를 주로 사용한다고. (전문가를 위한 CSS3, 2013)
