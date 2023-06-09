## usersテーブル

|Column             |Type   |Options|
| nickname          | string | null: false              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| last_name         | string | null: false              |
| first_name        | string | null: false              |
| last_name_kana    | string | null: false              |
| first_name_kana   | string | null: false              |
| birthday          | date   | null: false              |

### Association
  has_many :items
  has_many :purchases


## itemsテーブル
| Column               |Type        |Options|
| item                 | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_fee_id      | integer    | null: false                    |
| shipping_origin_id   | integer    | null: false                    |
| shipping_duration_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchases

## purchasesテーブル
|Column    |Type       |Options|
| user     | references| null: false, foreign_key: true|
| item     | references| null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addressesテーブル
|Column              |Type        |Options|
| postal_code        | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| purchase           | references | null: false, foreign_key: true |
### Association
belongs_to :purchase