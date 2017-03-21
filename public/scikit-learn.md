# 분류기 비교
![](http://scikit-learn.org/stable/_images/sphx_glr_plot_classifier_comparison_001.png)[^2]

[^2]: http://scikit-learn.org/stable/auto_examples/classification/plot_classifier_comparison.html

# 적절한 평가 모델 선택
![](http://scikit-learn.org/stable/_static/ml_map.png)[^1]

[^1]: http://scikit-learn.org/stable/tutorial/machine_learning_map/

# 팩키지
[^3]

[^3]: https://www.datascienceschool.net/view-notebook/293ece8b0d124fbaa4d4d52bb8f1cb42/

- 자료 제공:
  - `sklearn.datasets`: 샘플 데이타
- 자료 전처리:
  - `sklearn.preprocessing`: LabelEncoder, Standardization/Normalization/Binarization
  - `sklearn.feature_extraction`: image, text
    - `sklearn.feature_extraction.text`: CountVectorizer, TfidfVectorizer
- 모형 도구:
  - `sklearn.base`: Base classes and utility functions
  - `sklearn.model_selection`: train_test_split, Hyper-parameter optimizers, Model validation, 예전 cross_validation의 모형 평가 포함.
  - `sklearn.pipeline`: make_pipeline, 전처리/특성선택/모델링을 연결하여 하나의 모델처럼 행동.
- 모형 알고리즘:
  - `sklearn.decomposition`: dimensionality reduction. PCA, ICA, LDA(Latent Dirichlet Allocation).
  - `sklearn.ensemble`: RandomForest, AdaBoost
  - `sklearn.linear_model`: LinearRegression, Perceptron
  - `sklearn.naive_bayes`: Gaussian/Multinomial/Bernoulli NB
  - `sklearn.neighbors`: kNN
  - `sklearn.cluster`: Clustering
    - k-Means, DBSCAN
  - `sklearn.svm`: Support Vector Machines
  - `sklearn.tree`: Decision Trees
- 모형 평가:
  - `sklearn.metrics`: accuracy_score, f1_score, precision/recall_score
  - `sklearn.model_selection`: 예전 cross_validation이 DEPRECATED되고 모형 평가는 model_selection에 통합.

# 클래스
[^3]

- 전처리용 클래스
  - **fit()**: 모형 계수 추정, 트레이닝(training)
  - **transform()**: 자료 처리
  - **fit_transform()**: 모형 계수 추정 및 자료 처리 동시 수행
- 머신러닝 모형 클래스
  - **fit()**: 모형 계수 추정, 트레이닝(training)
  - **predict()**: 주어진 x값에 대해 y 예측
  - **score()**: 성과 분석
- Pipeline 클래스
  - 복수의 Preprocessor와 Model을 연결하여 하나의 Model처럼 행동
  - Model 클래스가 제공하는 공통 메서드를 모두 제공
  - pipeline 내부에서 Preprocessor에서 자료를 계속 변형한 후 마지막으로 Model에 입력

# 기타: matplotlib
[matplotlib의 여러가지 플롯](https://www.datascienceschool.net/view-notebook/6e71dbff254542d9b0a054a7c98b34ec/)