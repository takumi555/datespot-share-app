## 東京デート倶楽部
<br>
<img src="https://user-images.githubusercontent.com/67146063/120076691-d6de4e80-c0e1-11eb-890b-9a31ac536cf3.png" width="400px">

東京デート倶楽部は「 今度のデートどうしよう 」という悩みを解決するサービスです。


## URL
https://tokyodateclub.com/  
※ログイン画面のゲストログインボタンから簡単にログインができます。

## サービス概要 
今度のデートプランどうしよう…という悩みは多くの方に経験があることかと思います。  

・どこに行けばいいのかわからない  
・デートがマンネリ化してきた  
・気になる場所があるけど不安がある、もっと情報が欲しい 

などなど、実際に私も悩んできました。
その悩みを解決できるサービスとして、この「東京デート倶楽部」を作成いたしました。  

主な使い方としては、下記の通りです。  
①おすすめのデートスポットを投稿し、他のユーザーは投稿を参考にデート先を決めることができる  
②投稿に対するコメントで、そのスポットに関する質問ができる  
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
- 質問の投稿/表示/編集/削除
- 質問への回答
- ダイレクトメッセージ
- 各アクションを通知でお知らせ

## 主な使用技術
- Ruby 2.6.6
- Ruby on Rails 6.0.3.6
- HTML/CSS
- jQuery 1.12.4
- PostgreSQL 11.11　
- RSpec
- Capistrano
- AWS (VPC、EC2、RDS、S3、Route53)

## AWS構成図

<img src="https://user-images.githubusercontent.com/67146063/120066689-94514d80-c0b2-11eb-9169-02da88b6b922.png" width="600px">



## 各種機能＆導入技術
- ユーザー登録＆ログイン(devise)
- 画像アップロード機能（Active Storage）
- 画像のリサイズ(MiniMagick)
- いいね、コメントと質問回答投稿、ダイレクトメッセージ（Ajax）
- ページネーション機能（kaminari）
- 管理者ページ（Active Admin)
- コードフォーマッティング(Rubocop)
- デバッグ(pry-byebug)

#### テスト
- Rspec  
　単体テスト(model)  
　機能テスト(request)  
　統合テスト(system)  
- Capybara  
- Faker  
- FactoryBot

## 各画面の説明
### ①投稿一覧画面  
<img src="https://user-images.githubusercontent.com/67146063/120078674-91268380-c0eb-11eb-9319-05cfa1fce6b8.png" width="800px">  

投稿一覧画面です。  
都道府県で絞る、タグで検索する、フリーワードで検索するなどの検索方法が可能です。  
また、いいね数が多い人気投稿順や、フォローしているユーザーの投稿のみを表示させることもできます。

### ②投稿詳細画面
<img src="https://user-images.githubusercontent.com/67146063/120096782-5ca4dd00-c168-11eb-8b65-85f557696bbf.gif" width="800px">  

投稿詳細画面です。  
コメント、いいねはAjaxで行うことができます。  
画像が複数枚あるときは、メイン画像下の画像リストをホバーすることで切り替えができ、メイン画像をクリックすることで大きさを変更できます。

### ③質問詳細画面
<img src="https://user-images.githubusercontent.com/67146063/120097427-5f550180-c16b-11eb-8d84-f2dd2885acae.gif" width="800px">  

質問を投稿し、他のユーザーは質問に対し回答をすることができます。  
回答はAjaxでできるようにしています。 

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
<img src="https://user-images.githubusercontent.com/67146063/120097643-a099e100-c16c-11eb-8f2a-b2c92570bad7.gif" width="200px">  

### ③質問詳細画面  
<img src="https://user-images.githubusercontent.com/67146063/120097645-a55e9500-c16c-11eb-89fc-55b17000ccaf.gif" width="200px">  

### ④ダイレクトメッセージ画面  
<img src="https://user-images.githubusercontent.com/67146063/120896033-9e4af180-c65a-11eb-95be-266fa5354e49.PNG" width="200px">  

