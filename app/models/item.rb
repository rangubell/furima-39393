class Item < ApplicationRecord

  validates :item,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true
  validates :condition_id,          presence: true
  validates :shipping_fee_id,       presence: true
  validates :shipping_origin_id,    presence: true
  validates :shipping_duration_id,  presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :user,                  presence: true
  validates :image,                 presence: true

  has_one_attached :image

  belongs_to :user
  has_one :purchase
end
