class Item < ApplicationRecord
  validates :item,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, exclusion: { in: [1], message: 'must be selected' }
  validates :condition_id,          presence: true, exclusion: { in: [1], message: 'must be selected' }
  validates :shipping_fee_id,       presence: true, exclusion: { in: [1], message: 'must be selected' }
  validates :shipping_origin_id,    presence: true, exclusion: { in: [1], message: 'must be selected' }
  validates :shipping_duration_id,  presence: true, exclusion: { in: [1], message: 'must be selected' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A\d+\z/ }
  validates :image, presence: true

  has_one_attached :image

  belongs_to :user
  has_one :purchase
  # has_one :purchase
end
