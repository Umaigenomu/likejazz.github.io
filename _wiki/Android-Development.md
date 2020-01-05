---
layout: wiki 
title: Android Development
last-modified: 2019/12/21
---

<!-- TOC -->

- [Launch a activity](#launch-a-activity)
- [Show toast message](#show-toast-message)
- [Call from a custom view](#call-from-a-custom-view)
- [Speech Recognition](#speech-recognition)
- [Activity Lifecycle](#activity-lifecycle)
- [AsyncTask](#asynctask)
- [Fragment](#fragment)
- [Glide](#glide)
- [multidex](#multidex)
- [AAC](#aac)
- [Butter Knife](#butter-knife)
- [MVVM](#mvvm)
- [Room](#room)
- [예전 프로젝트에 대한 빌드](#예전-프로젝트에-대한-빌드)
- [SharedPrefrences](#sharedprefrences)

<!-- /TOC -->

안드로이드의 이벤트 코딩 방식은 상당히 verbose하고 가독성이 떨어진다. 몇 가지 자주 사용하는 이벤트에 대해 스니펫 형태로 정의한다.

# Launch a activity
```java
Button btn = findViewById(R.id.button);
btn.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View view) {
        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
        startActivity(intent);
    }
});
```

# Show toast message
```java
    ...
    ListView arrayView = findViewById(R.id.main_listview_array);
    arrayView.setOnItemClickListener(this);
    ...

@Override
public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    Toast.makeText(this, arrayDatas[position], Toast.LENGTH_SHORT).show()
}
```

# Call from a custom view
```java
@Override
public boolean onTouchEvent(MotionEvent event) {
    ...
    OnMyChangeListener listener;
    listener.onChange(value);
    ...

public interface OnMyChangeListener {
    void onChange(int value);
}
...
public class MainActivity extends AppCompatActivity implements OnMyChangeListener{
    ...
    @Override
    public void onChange(int value) {
        ...
```

인터페이스를 구현한 클래스를 자신에게 등록해서 지정된 함수를 이용해 자신의 상태를 전달하는게 GoF의 옵저버 패턴 <sup>Observer Pattern</sup>이다.

# Speech Recognition
```java
Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
intent.putExtra(RecognizerIntent.EXTRA_PROMPT, "말씀해주세요.");
startActivityForResult(intent, 50);
...
protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
    if (requestCode == 50 && resultCode == RESULT_OK) {
        ArrayList<String> results = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
        String result = results.get(0);
        resultView.setText(result);
    }
```

# Activity Lifecycle
<img src="https://developer.android.com/guide/components/images/activity_lifecycle.png" width="70%">

# AsyncTask
https://developer.android.com/reference/android/os/AsyncTask
AsyncTask는 스레드-핸들러의 추상화 개념 정도

# Fragment
Fragment는 다른 뷰와 다르게 액티비티의 생명주기를 그대로 따르는 뷰이다.

# Glide
Glide는 2014년 구글 IO 행사에서 발표된 라이브러리로 원래 Bump 앱에서 내부적으로 이용하던 라이브러리를 구글이 인수하여 공개한 이미지 핸들링 라이브러리

Matisse는 갤러리를 연동하기 위한 라이브러리

# multidex
https://developer.android.com/studio/build/multidex

# AAC
https://developer.android.com/topic/libraries/architecture

# Butter Knife
https://jakewharton.github.io/butterknife/  
Development on this tool is winding down.

https://developer.android.com/topic/libraries/view-binding  
In most cases, view binding replaces findViewById.  
정리해보면, 데이터 바인딩은 액티비티/프래그먼트에 작성해야 하는 뷰 관련 코드를 XML에 작성하자는 개념이다.

# MVVM
Model-View-ViewModel

# Room
룸은 SQLite 추상화 라이브러리

# 예전 프로젝트에 대한 빌드
Gradle 2.x 프로젝트는 그대로 빌드되지 않는다. 왜냐면, `repositories`에 `jcenter()`만 등록되어 있기 때문이다. 따라서 아래와 같이 수정해야 한다.
```
repositories {
    jcenter()
    maven {
        url 'https://maven.google.com/'
        name 'Google'
    }
}
```
Gradle 5.x에서는 단순히 `google()`을 지정하면 되나 예전 버전은 저렇게 주소를 명시해야 한다. 또는, 오류 화면에서 `Add Google Maven repository and sync project`를 선택 하면 자동으로 설정해준다.

# SharedPrefrences
Device File Explorer &gt; com.google.cloud.android.speech &gt; shared_prefs &gt; com.google.cloud.android.speech_preferences.xml
```
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <boolean name="seat.heater.frontLeft.on" value="true" />
    <string name="seat.heater.frontLeft.level">3</string>
    ...
</map>
```
string과 boolean 두 가지 타입을 지원한다.
