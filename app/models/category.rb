class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_option
  validates :category_option_id, numericality: { other_than: 1, message: "must be selected" }

  def shipping_duration_options
    Shipping_Duration_Option.all
  end

  has_many :items
end
