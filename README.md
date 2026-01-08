# Riverpod

- 용도 : 상태 관리

## 사용법
- 상태 클래스 만들기
- 뷰모델 만들기
- 뷰모델 관리자 만들기

## 이전 버전과 변동사항
- 이전 버전에서는 뷰모델의 종류가 다양
    - Notifier : 기본 뷰모델. 한번 사용되면 앱이 종료될때까지 유지
    - AutoDisposeNotifier : 한번 사용되고 더이상 사용되지 않을 때 메모리에서 제거
    - FamilyNotifier : Notifier와 동일하나 인자(아규먼트) 받을 때 사용
    - AutoDisposeFamilyNotifier : AutoDisposeNotifier + FamilyNotifier 의 결합체
    - ...
- Notifier 클래스가 너무 많다
- Notifier 하나만 쓰자!