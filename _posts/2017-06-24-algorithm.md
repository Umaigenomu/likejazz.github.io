---
layout: post
title: 쿼리 구분
invisible: true
---

<div class="message">

</div>

*2017년 6월 24일 초안 작성*

## 내용

검색 쿼리를 확장하여 결과를 보여주는 서비스를 만들고 있다. 예를 들어 사용자가 "설현" 쿼리를 입력한다면 "설현 화보"라는 확장 검색 결과를 보여준다. 여기서 "설현"과 "화보"를 구분하여 제목을 보여주면 확장 검색 결과라는걸 인지시키기 쉬울 것이라는 판단에 따라 중간에 "x"를 구분자로 하는 매크로를 만들었다.

## 사용 언어

최종결과의 UI와 밀접한 관련이 있으므로 구현은 최종 템플릿에서 하기로 했고 FreeMarker로 구현하기로 했다. 템플릿 전용 언어가 다른 언어에 비해 제약이 많은 특성상 여기서 제공하는 String Manipulation 기능들로 구현이 가능한지 살펴봤고 템플릿 전용 언어 답지 않게 FreeMarker는 파이썬의 slice와 유사한 형태로 문자열을 처리하는등 강력한 기능들로 무장해있다. 충분히 가능할거라 판단했고 하나씩 알고리즘을 구현해봤다.

```
<#-- 원쿼리와 확장부를 구분해서 제목을 출력하는 매크로 -->
<#macro printTitleSeparately q pq>
    <#-- 쿼리 정제 -->
    <#assign q_trimmed  = q?trim?replace(" ", "")>
    <#assign pq_trimmed = pq?trim?replace(" ", "")>

    <#-- 원쿼리와 확장쿼리가 동일한 경우 확장쿼리 출력하고 종료 -->
    <#if q_trimmed == pq_trimmed>
        <strong class="txt_name">${q}</strong>
        <#return>
    </#if>

    <#-- 확장쿼리에 원쿼리가 포함되지 않는 경우 확장쿼리 출력하고 종료 -->
    <#if q_trimmed?index_of(pq_trimmed) == -1>
        <strong class="txt_name">${q}</strong>
        <#return>
    </#if>

    <#assign pos_for_divide = 0>
    <#list 0..q?length - 1 as index>
        <#-- 시작 위치를 늘려가며 첫 단어의 매칭 위치 조사 -->
        <#assign pos = q?index_of(pq_trimmed[0], index)>
        <#-- 더 이상 일치하는 위치가 없다면 중단 -->
        <#if pos == -1>
            <#break>
        </#if>

        <#-- 매칭 위치 이후 단어 추출, 정제 -->
        <#assign q_remainig = q[pos..]>
        <#assign q_remainig = q_remainig?trim?replace(" ", "")>

        <#-- 정제한 전체 단어가 원쿼리 정제와 일치한다면 이 위치로 선정 -->
        <#if q_remainig?starts_with(pq_trimmed)>
            <#assign pos_for_divide = pos>
            <#break>
        </#if>
    </#list>

    <#-- 전방 매칭일때는 단어 수 만큼 이동하여 마지막 문자 위치 탐색 -->
    <#if pos_for_divide == 0>
        <#assign pos_for_divide = q?index_of(
            pq_trimmed[pq_trimmed?length - 1], pq_trimmed?length - 1
        ) + 1>
    </#if>

    <#-- 이제 배를 가름 -->
    <#assign q1 = q[0..pos_for_divide - 1]>
    <#assign q2 = q[pos_for_divide..]>

    <#-- HTML 출력 -->
    <strong class="txt_name">${q1}</strong>
    <span class="txt_line">x</span>
    <strong class="txt_name">${q2}</strong>
</#macro>
```