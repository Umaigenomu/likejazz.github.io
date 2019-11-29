---
layout: wiki 
title: Android Development
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