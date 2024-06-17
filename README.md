# README

## アプリケーション名
FinanceMemo

## アプリケーション概要
このアプリケーションは株式の管理をするためのもので、ユーザーが株式を作成、表示、編集、アーカイブ、削除できる機能を提供します。  
また、アーカイブされた株式を表示する履歴機能も含まれています。  
以下に、アプリケーションのセットアップおよび使用方法の詳細なガイドを示します。

## URL
https://finance-memo-ouqx.onrender.com

## basic認証
	ユーザー名:admin
 	パスワード:2222

## テスト用アカウント
	name：しお
	email:siosan@siosan  
	PASS :11111a

## 利用方法

### 新しい株式の作成
* メインページに移動します。
* 左側のフォームに銘柄コードまたは銘柄名を入力します。
* 「Create Stock」ボタンをクリックします。

### 株式の詳細表示
* 左側のリストから株式エントリをクリックします。
* 詳細が右側に表示されます。

### メモの管理
* 株式の詳細を表示します。
* 提供されたフォームにメモを追加し、送信します。
* メモが選択された株式に関連付けられます。

### 画像の管理
* 株式の詳細を表示します。
* 提供されたフォームに画像を追加し、送信します。
* 画像が選択された株式に関連付けられます。

### 株式のアーカイブ
* 株式の詳細を表示します。
* 「Archive Stock」ボタンをクリックして履歴リストに移動します。

### 履歴
* 履歴ページに移動してアーカイブされた株式を表示します。
* このページから株式をアクティブに戻すことができます。

## アプリケーションを作成した背景
数多くの株式アプリが存在し、証券会社が提供するアプリではチャートに線を引いたりすることも可能です。  
しかし、その線に基づいて売買の予定をメモする機能があるアプリがなく、後日チャートを見直したときに、当初の予定や考えを忘れてしまうことが多く、非常に不便でした。  
そこで、画像を貼り付け、売買の予定や監視するべき内容などを簡単にメモして残すことができるアプリが必要だと感じ、株式の分析や計画をより効果的に管理するために、このアプリを開発しました。

## 実装した機能についての画像やGIFおよびその説明
[![Image from Gyazo](https://i.gyazo.com/972af5addfc3d05ad98c0cf986f351a8.png)](https://gyazo.com/972af5addfc3d05ad98c0cf986f351a8)
* サインインまたはログインした状態です。
* 銘柄コード（ticker）または株式名（name）を入力し、「New Stock」ボタンを押すと下に該当の株式が表示されます。
<br><br>

[![Image from Gyazo](https://i.gyazo.com/1231ab4f19509e660931122e5aef3e8a.png)](https://gyazo.com/1231ab4f19509e660931122e5aef3e8a)
* 銘柄詳細画面です。複数枚の画像を貼ることができ、売買予定の複数のメモを残すことができます。
* 画像にカーソルを合わせると右上に削除ボタンが現れるため、ここで画像の管理もできます。
* 同様にメモも削除ボタンにて管理できます。
<br><br>

[![Image from Gyazo](https://i.gyazo.com/02691272e5ec37ee75c426d3d0a6bc49.png)](https://gyazo.com/02691272e5ec37ee75c426d3d0a6bc49)
* 売買予定がなくなったものは削除するか、履歴としてアーカイブページに残せます。
* 「戻す」ボタンを押すことで一覧表示のページへと該当株式が戻ります。
<br><br>

## 実装予定の機能
* ユーザー画像（アイコン）の登録
* PDFの登録

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/04e820add01a1d07d1d6ac1bab005077.png)](https://gyazo.com/04e820add01a1d07d1d6ac1bab005077)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2b4f93ee88d20fea807af62d0b4aa507.png)](https://gyazo.com/2b4f93ee88d20fea807af62d0b4aa507)

## 開発環境
* フロントエンド：<img src="https://img.shields.io/badge/Javascript-276DC3.svg?logo=javascript&style=flat">
* バックエンド：<img src="https://img.shields.io/badge/-Rails-CC0000.svg?logo=rails&style=flat">
* ミドルウェア：<img src="https://img.shields.io/badge/-PostgreSQL-336791.svg?logo=postgresql&style=flat">
* テキストエディタ：<img src="https://img.shields.io/badge/-Visual%20Studio%20Code-007ACC.svg?logo=visual-studio-code&style=flat">
* タスク管理：<img src="https://img.shields.io/badge/-GitHub-181717.svg?logo=github&style=flat">

## ローカルでの動作方法
1. git clone https://github.com/milsio0117/finance_memo.git
2. cd finance_memo
3. brew install imagemagick
4. bundle install

## 工夫したポイント
* ユーザビリティを考慮し、株式の新規登録画面と編集画面をなくし、詳細ページでのメモおよび画像の登録と削除のみとしました。
* 快適なブラウザ操作の実現のため、メモ機能はAjaxを使用しました。
* 今後実装したい機能や改善点をタスク管理としてGitHubのProject機能に設定し、開発プロセスを効率化しました。
* 株式コードや銘柄名はCSVファイルから動的に呼び出せるようにし、サービスクラスでロジックを整理しました。
* 心理的な面から、冷静に銘柄分析ができるよう、メインカラーは寒色系としました。

## 改善点
* jsのエラーログが出ている点を修正予定。画像ファイル選択前にuploadボタンを押すとエラーになります。
* アーカイブされた株式については編集できないように改善予定です。
* 株式情報についてはAPIの導入により表示をしたいと思っています。  
当初はAPIの導入を試みましたが、HTTPリクエストエラーにより実現できず、時間を考慮しcsvからの取り込みに切り替えました。  
APIにより新規上場や上場廃止などにも自動的に対応できるため、今後は再度導入を試みようと思います。

## 制作時間
10日間
