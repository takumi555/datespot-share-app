# 東京デート倶楽部

東京デート倶楽部は「　今度のデートどうしよう　」という悩みを解決するサービスです。


## URL
http://tokyodateclub.com/  
※ログイン画面のゲストログインボタンから簡単にログインができます。

## サービス概要 
恋愛に関する悩みの一つに、デートプランどうしよう…というのは多くの方に経験があることかと思います。    

・どこに行けばいいのかわからない  
・デートがマンネリ化してきた  
・気になる場所があるけど不安がある、もっと情報が欲しい 

などなど、実際に私も悩みに悩み続けてきました。  
その悩みを解決できるサービスとして、この「東京デート倶楽部」を開発いたしました。  

主な使い方としては、下記の通りです。  
①おすすめスポットを投稿し、他のユーザーはデート先を決める参考にできる  
②投稿に対するコメントで、具体的にそのスポットについての質問ができる  
③質問部屋を利用し、恋愛やデート全般に関する質問ができる  
④ダイレクトメッセージ機能で直接のコミュニケーションが取れる  

## このアプリでできること
### ユーザー関連
- ユーザーの登録/編集/削除
- アバター画像の登録
- ユーザーのフォロー/フォロー解除機能

#### 投稿関連
- 記事の投稿/表示/編集/削除
- 投稿へのコメント/コメント削除
- 投稿へのいいね/いいね解除

#### 投稿の表示関連
- 投稿をタグで検索
- 投稿をエリア（都道府県）から検索
- 投稿を自由なワードで検索
- いいね数の多い人気投稿の表示
- フォローしているユーザーの投稿のみを表示
- いいねした投稿の一覧を表示

#### 質問関連
- 質問の投稿/編集/削除
- 質問への回答/回答削除

#### その他
- ダイレクトメッセージ
- 各アクションを通知でお知らせ

## 主な使用技術
- Ruby 2.6.6
- Ruby on Rails 6.0.3.6
- HTML/CSS
- PostgreSQL
- jQuery
- RSpec
- Nginx
- Puma
- Capistrano

#### インフラ
AWS
- VPC
- EC2
- RDS
- S3
- Route53

## AWS構成図

![AWS構成図](https://user-images.githubusercontent.com/67146063/120066440-530c6e00-c0b1-11eb-8b3f-7aa5e7ee9887.png)


## 各種機能＆導入技術
- ユーザー登録＆ログイン(Devise)
- 画像アップロード機能（Active_storage、AWS S3）
- いいね、コメントと質問回答投稿、ダイレクトメッセージ（Ajax）
- ページネーション機能（kaminari）
- 管理者ページ（Active_admin)


#### テスト
Rspec  
- 単体テスト(model)
- 機能テスト(request)
- 統合テスト(system)

Capybara  
factory_bot  

## モデルの図

## 各画面の説明

## レスポンシブデザイン
