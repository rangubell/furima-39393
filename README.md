## usersテーブル

|Column             |Type   |Options|
| nickname          | string | null: false|
| email             | string | null: false|
| encrypted_password| string | null: false|
| name              | string | null: false|
| birthday          | integer| null: false|

### Association
  has_many :items
  has_many :purchases
  has_one :shipping_address


## itemsテーブル
| Column      |Type       |Options|
| item        | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchases

## purchasesテーブル
|Column    |Type       |Options|
| user_id  | references| null: false, foreign_key: true|
| item_id  | references| null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addressesテーブル
|Column              |Type        |Options|
| shipping_address   | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| purchase_id        | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :purchase