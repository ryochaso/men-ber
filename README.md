# men-ber 

## アプリケーションの目的
　このアプリケーションは海外から来られた外国人観光客向けのアプリケーションです。men-berアプリケーションは、外国人観光客に特に人気のある食べ物、ラーメンにスポットライトを当てており、日本ラーメンの情報を利用者同士で共有したり、投稿されている情報を検索して自分に合いそうなラーメンを見つけることができます。　このアプリケーションを通して外国人観光客が日本に来てよかった、また日本を訪れたいと思ってもらうことを目的としています。

## 背景
　外国人観光客が非常に多いと同時に、ラーメンを食べたいとよく耳にするので
何か役に立つことができればと考えたのがきっかけです。
実際に海外にお住まいの外国人、20名ほどに聞いたところラーメンを食べたい
と言っていたので、情報が共有できるアプリケーションがあれば良いのでないか？
　
　また、ベジタリアンやビーガンといったライフスタイルを持っている方が日本よりも多いので、そう言った方にもラーメンを食してもらう機会を提供できるようなものがあればいいなと思い開発しました。


##  テーブル設計

### userテーブル

|Column               |Type       |Options                   |
|---------------------|-----------|--------------------------|
| nickname            | string    | null: false              |
| email               | string    | null: false              |
| encrypted_password  | string    | null: false              |
| family_name         | stirng    | null: false              |
| first_name          | string    | null: false              |
| country             | stirng    | null: false              |

###  Association
 has_many: photos
 has_many: comments

### photoテーブル

 
|Column        |Type        |Options                         |
|--------------|------------|--------------------------------|
| text         | text       |                                |
| taste_id     | integre    | null: false, foreign_key: true |
| prefecture_id| integre    | null: false                    |
| score        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

 ###  Association
 belongs_to: user
 has_many: comments
 has_many: tag ??
 has_many: photo_tag

### commentテーブル

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| photo   | references | null: false, foreign_key: true |

###  Association
 belongs_to: user
 belongs_to: photo

 ### tagテーブル

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
| name    | string     | null: false                    |
| photo   | references | null: false, foreign_key: true |

###  Association
 belongs_to: photo ??
 has_many: photo_tag

### photo_tagテーブル

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
| photo   | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |


###  Association
 belongs_to: photo
 belongs_to: tag