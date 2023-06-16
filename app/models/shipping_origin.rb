class ShippingOrigin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_origin_Option

  def self.shipping_origin_options
    Shipping_Origin_Option.all
  end

  has_many :items
end
