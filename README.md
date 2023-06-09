## usersテーブル

|Column             |Type   |Options|
| nickname          | string | null: false              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| birthday          | date   | null: false              |

### Association
  has_many :items
  has_many :purchases
  has_one :shipping_address


## itemsテーブル
| Column         |Type        |Options|
| item           | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

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
| shipping_address   | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |
### Association
belongs_to :purchase