class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_option
  validates :category_option_id, numericality: { other_than: 1 , message: "can't be blank"}
end
