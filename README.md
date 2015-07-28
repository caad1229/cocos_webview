## webview on cocos2d-x

### 1. Overview

Cocos2d-xのWebView uiクラスを使ってみる

### 2. Build

#### 2-1. android

 - エミュレータの場合、CPU設定をADMにすること
 - エミュレータの場合、`Use Host GPU`にチェックしておくこと
 - アプリをインストールする場合、デバイスに接続しておく必要がある

```
$ make android          # buildして接続しているデバイスにインストールする
$ make build_android    # buildのみ
$ make clean_android    # android関連をクリーン
```

#### 2-2. ios

- エミュレータの場合、自動的に立ち上がる

```
$ make ios          # buildしてアプリケーションが実行される
$ make build_ios    # buildのみ
$ make clean_ios    # ios関連をクリーン
```

#### 2-3. Linux


```
$ make linux
$ make build_linux
$ make clean_linux
```

#### 2-4. distclean

- cocos2d-xのライブラリを含むすべてが削除される
- 再度ビルドする場合は時間がかかる

```
$ distclean
```
