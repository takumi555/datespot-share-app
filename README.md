## 東京デート倶楽部

  
<img src="https://user-images.githubusercontent.com/67146063/120076691-d6de4e80-c0e1-11eb-890b-9a31ac536cf3.png" width="400px">

東京デート倶楽部は「　今度のデートどうしよう　」という悩みを解決するサービスです。


## URL
http://tokyodateclub.com/  
※ログイン画面のゲストログインボタンから簡単にログインができます。

## サービス概要 
恋愛に関する悩みの一つに、デートプランどうしよう…というのは多くの方に経験があることかと思います。    

・どこに行けばいいのかわからない  
・デートがマンネリ化してきた  
・気になる場所があるけど不安がある、もっと情報が欲しい 

などなど、実際に私も悩み続けてきました。  
その悩みを解決できるサービスとして、この「東京デート倶楽部」を作成いたしました。  

主な使い方としては、下記の通りです。  
①おすすめのデートスポットを投稿し、他のユーザーは投稿を参考にデート先を決めることができる  
②投稿に対するコメントで、そのスポットに関する質問等ができる  
③質問部屋を利用し、恋愛やデート全般に関する質問ができる  
④ダイレクトメッセージ機能で他のユーザーと直接のコミュニケーションが取れる  

## このアプリでできること
- ユーザーの登録/編集/削除
- ユーザーのフォロー
- 記事の投稿/表示/編集/削除
- 投稿へのコメント
- 投稿へのいいね
- 投稿をタグで検索
- 投稿をエリア（都道府県）から検索
- 投稿をフリーワードで検索
- いいね数の多い人気投稿の表示
- フォローしているユーザーの投稿のみを表示
- いいねした投稿の一覧を表示
- 質問の投稿/編集/削除
- 質問への回答
- ダイレクトメッセージ
- 各アクションを通知でお知らせ

## 主な使用技術
- Ruby 2.6.6
- Ruby on Rails 6.0.3.6
- HTML/CSS
- PostgreSQL
- jQuery
- RSpec
- Capistrano
- AWS (VPC、EC2、RDS、S3、Route53)

## AWS構成図

<img src="https://user-images.githubusercontent.com/67146063/120066689-94514d80-c0b2-11eb-9169-02da88b6b922.png" width="600px">
※ap-northeast-1cの2つのサブネットはそれぞれALB、RDSの利用条件を満たすために設置。


## 各種機能＆導入技術
- ユーザー登録＆ログイン(Devise)
- 画像アップロード機能（Active_storage）
- いいね、コメントと質問回答投稿、ダイレクトメッセージ（Ajax）
- ページネーション機能（kaminari）
- 管理者ページ（Active_admin)

#### テスト
- Rspec  
　単体テスト(model)  
　機能テスト(request)  
　統合テスト(system)  
- Capybara  
- factory_bot  

## 各画面の説明
### ①投稿一覧画面  
<img src="https://user-images.githubusercontent.com/67146063/120078674-91268380-c0eb-11eb-9319-05cfa1fce6b8.png" width="800px">  

投稿一覧画面です。  
都道府県で絞る、タグで検索する、フリーワードで検索するなどの検索方法が可能です。  
また、いいね数が多い人気投稿順や、フォローしているユーザーの投稿のみを表示させることもできます。

### ②投稿詳細画面
<img src="https://user-images.githubusercontent.com/67146063/120091024-06bd3e80-c142-11eb-9df0-b8ca69259f20.gif" width="800px">  

投稿詳細画面です。  
コメント、いいねはAjaxで行うことができます。  
画像が複数枚あるときは、下の画像リストをホバーすることで切り替えができ、画像をクリックすることで大きさを変更できます。

### ③質問詳細画面
<img src="https://user-images.githubusercontent.com/67146063/120091376-91ec0380-c145-11eb-9db5-26e9975c2739.gif" width="800px">  

質問を投稿し、他のユーザーは質問に対し回答をすることができます。  
回答はAjaxでできるようにしています。  
質問内容は恋愛に関すること出れば基本なんでもOKです。  

### ④ダイレクトメッセージ画面
<img src="https://user-images.githubusercontent.com/67146063/120079756-60951880-c0f0-11eb-95d4-6c1bece8ef1b.png" width="800px">  

他のユーザーのプロフィール画面から、ダイレクトメッセージボタンを押すことで、２人だけのトークルームを作成し、メッセージのやりとりができるようになるという仕様です。  
メッセージはAjaxを使って送信できるようにしています。  
多くの人が使い慣れているような、わかりやすい機能とデザインを意識しました。

## レスポンシブデザイン
PCだけでなく、タブレット、スマホのレスポンシブデザインにも対応しています。
下記はスマホのレスポンシブデザインです。

### ①投稿一覧画面
<img src="https://user-images.githubusercontent.com/67146063/120091786-391e6a00-c149-11eb-83c7-e023d1a31fb2.gif" width="200px">  

### ②投稿詳細画面 
<img src="https://user-images.githubusercontent.com/67146063/120091843-91556c00-c149-11eb-8a22-244c616ec5e7.gif" width="200px">  

### ③質問詳細画面  
<img src="https://user-images.githubusercontent.com/67146063/120091845-93b7c600-c149-11eb-9703-4d4ac918b80d.gif" width="200px">  

### ④ダイレクトメッセージ画面  
<img src="https://user-images.githubusercontent.com/67146063/120091636-01fb8900-c148-11eb-828e-7d72c8ff5a63.PNG" width="200px">  

