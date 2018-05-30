# sudukuri-esa

# なにこれ？

毎朝10:00に "指定したカテゴリ/前日のyyyy/前日のmm/前日のdd" のカテゴリにあるesaの記事をslackに投稿するスクリプトたちです。
CircleCIの[workflows](https://circleci.com/docs/2.0/workflows/) の仕組みを使っています。

動作確認のため、リモートリポジトリへのpush時はCI上でdry-run（後述）します（ `.circleci/config.yml` に記述してあれば）

# 実行の仕方

## 共通

1. esaのAPIトークンとSlackのwebhookを取得します
1. （必要なら） `sudukuri.rb` 内のオプションを変更します

## 開発環境の場合

1. `.env` にesaのAPIトークンとSlackのwebhookを書きます（ `.env.sample` を参考にしてください）
1. `.ruby-version` をもとにRubyをインストール（CircleCIで使うコンテナで使っているRubyのバージョンと合わせてください）
1. `bundle update`
1. `DRY_RUN=1 bundle update ./sudukuri.rb` するとコンソールに結果が表示されます
    - `DRY_RUN=1` しないとSlackに投稿されます

## CircleCIの場合

リポジトリのCircleCIのページに飛び、「Project settings」の「BUILD SETTINGS」 > 「Environment Variables」から環境変数を設定してください（ `.env.sample` を参考にしてください）
ほかは `.circleci/config.yml` を参照してください。
（実装が変わったときのREADMEの変更コストを下げたいのでこちらには詳しく書きません）
