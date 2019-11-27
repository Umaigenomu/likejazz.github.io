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