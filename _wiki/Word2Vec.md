---
layout: wiki 
title: Word2Vec
---

<!-- TOC -->

- [Word Embeddings](#word-embeddings)
    - [왜 word2vec이 단어 표현<sup>word representation</sup>을 잘 하는가?](#왜-word2vec이-단어-표현word-representation을-잘-하는가)

<!-- /TOC -->

# Word Embeddings
![](https://cdn-images-1.medium.com/max/1600/1*jpnKO5X0Ii8PVdQYFO2z1Q.png)

```python
x = np.mean(context, axis=0)
h = np.dot(W1.T, x)
u = np.dot(W2.T, h)
y_pred = softmax(u)

e = -center + y_pred
```
[문장 임베딩 Sent2Vec과 fastText 구현](http://docs.likejazz.com/sent2vec/)

## 왜 word2vec이 단어 표현<sup>word representation</sup>을 잘 하는가?
The reasons for successful word embedding learning in the word2vec framework are poorly understood. Goldberg and Levy point out that the word2vec objective function causes words that occur in similar contexts to have similar embeddings (as measured by cosine similarity) [위키](https://en.wikipedia.org/wiki/Word2vec#Analysis), [논문](https://arxiv.org/abs/1402.3722)
