class ShippingFee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_option

  def self.shipping_fee_options
    Shipping_Fee_Option.all
  end

  has_many :items
end
