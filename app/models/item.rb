class Item < ApplicationRecord

  validates :item,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true
  validates :condition_id,          presence: true
  validates :shipping_fee_id,       presence: true
  validates :shipping_origin_id,    presence: true
  validates :shipping_duration_id,  presence: true
  validates :price,                 presence: true
  validates :user,                  presence: true

  has_one_attached :image

end
