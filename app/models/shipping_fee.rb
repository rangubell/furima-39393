class ShippingFee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ShippingFeeOption
end
