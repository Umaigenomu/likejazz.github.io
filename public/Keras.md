다양한 Keras 모델을 정리한다.

## Tutorial
- [Keras 제공 모델](https://github.com/fchollet/keras/tree/master/examples)
- [Keras ports of nlintz's TensorFlow Tutorials](https://github.com/tgjeon/Keras-Tutorials)

`input_dim` = `input_shape`, x의 갯수. 첫 레이어는 반드시 지정. dim, shape는 표기의 차이만 있음.  
Keras는 pandas DataFrame 모델이 가능한 scikit-learn과 달리 numpy만 가능.

## CNN
- [VGG16](https://gist.github.com/baraldilorenzo/07d7802847aaad0a35d3)
  - [Keras Model Zoo](https://github.com/albertomontesg/keras-model-zoo) 형태로 미리 구현한 모델을 간단히 사용 가능
- [Inception V4](https://github.com/kentsommer/keras-inceptionV4)  
  - [Inception-v4](https://github.com/titu1994/Inception-v4)  
좀 더 사용하기 쉽게 모듈화

Error rate on non-blacklisted subset of ILSVRC2012 Validation Dataset (Single Crop):
- Top@1 Error: 19.54%
- Top@5 Error: 4.88%

## RNN
- [QRNN](https://github.com/DingKe/qrnn)  
Test score: 0.883183102427  
Test accuracy: 0.7816
- [IMDB Bidirectional LSTM](https://github.com/fchollet/keras/blob/master/examples/imdb_bidirectional_lstm.py)  
Summary: Loss over the test dataset: 0.62, Accuracy: 0.83
- [IMDB CNN LSTM](https://github.com/fchollet/keras/blob/master/examples/imdb_cnn_lstm.py)  
Test score: 0.345105096181  
Test accuracy: 0.853959994221  
원본 코드는 epoch=2 이며 5로 더 학습할 경우 train acc는 증가하나 test acc는 오히려 감소. 즉, 오버피팅된다.  
```
Epoch 5/5
25000/25000 [==============================] - 127s
loss: 0.0278 - acc: 0.9913 - val_loss: 0.6503 - val_acc: 0.8382
```
- [Recurrent Shop](https://github.com/datalogai/recurrentshop)
- [Seq2Seq](https://github.com/farizrahman4u/seq2seq)