# GetHub

## はじめに
issue数、watcher数の表示には[Search API](https://docs.github.com/ja/rest/reference/search#search-repositories)のレスポンスに含まれる「open_issues_count」および「watchers_count」を用いたが、  
実装中これらから得られる値がブラウザから確認できる値と異なることに気づいた。  
Search APIを利用する条件の範疇で修正しようとしたが、期限内に修正できる目処がつかなかったため保留とした。  
関連issue: [#50](https://github.com/icoriha/gethub/issues/50)

## Android
|検索ページ（Light）|詳細ページ（Light）|検索ページ（Dark）|詳細ページ（Dark）|
|-|-|-|-|
|![search_light_android](https://user-images.githubusercontent.com/56757293/185748500-6e957367-560d-4efd-adae-d0c947575fad.png)|![detail_light_android](https://user-images.githubusercontent.com/56757293/185748508-b9d226a3-51c8-429b-ac06-f873e4ebfee7.png)|![search_dark_android](https://user-images.githubusercontent.com/56757293/185748416-b1b5e3d5-44d7-473a-b42d-f99bda382380.png)|![detail_dark_android](https://user-images.githubusercontent.com/56757293/185748397-e546413f-120c-4ee8-bafd-1532863a3f3c.png)|

## iOS
|検索ページ（Light）|詳細ページ（Light）|検索ページ（Dark）|詳細ページ（Dark）|
|-|-|-|-|
|![search_light_ios](https://user-images.githubusercontent.com/56757293/185748612-a3528230-7015-4a59-abb7-ed8d4d46e143.png)|![detail_light_ios](https://user-images.githubusercontent.com/56757293/185748619-26a4b586-7944-4b64-8f39-a456986dd47c.png)|![search_dark_ios](https://user-images.githubusercontent.com/56757293/185748625-0a26ac08-508b-4174-8fb3-00cf6fe6f37a.png)|![detail_dark_ios](https://user-images.githubusercontent.com/56757293/185748630-0d857d31-f3cb-469a-8ed8-fd5aad317cce.png)|

## 環境
Android、iOSともに
開発環境と本番環境の2種類を用意した
|Android|iOS|
|-|-|
|<img width="122" alt="dev_prod_android" src="https://user-images.githubusercontent.com/56757293/185749088-ca588d88-75e0-49b5-a2b2-7c4ecaa3ae0a.png">|<img width="185" alt="dev_prod_ios" src="https://user-images.githubusercontent.com/56757293/185749117-fd87ca06-40aa-47cf-83b1-94bdf9d374ef.png">|

## 実行
|SDK|バージョン|
|-|-|
|Flutter|3.0.5|
|Dart|2.17.6|

Dart defineを用いて環境分けをしているため、実行時に環境変数としてFLAVORを表す文字列を渡す必要がある。
ただし、Makefileを作成しコマンドを定義しているため、make~ から始まる短いコマンドでも実行が可能。
### 開発環境
```
flutter run --dart-define=FLAVOR=dev
```
または
```
make run
```
### 本番環境
```
flutter run --dart-define=FLAVOR=prod
```
または
```
make run-prod
```

## アーキテクチャ
Presentation層をMVVMとしたクリーンアーキテクチャベース。  
Flutterプロジェクトとしては、Freezed + Riverpod + StateNotifierを用いた構成になっている。  
ViewModelはStateNotifierを継承したクラス（HogePageNotifeirと命名）とし、その状態はFreezedで生成する。  
APIとの通信処理は検索結果の取得のみであり、UseCaseは必要性を感じなかったため採用していない。
