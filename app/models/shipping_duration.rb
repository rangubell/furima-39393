class ShippingDuration < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ShippingDurationOption
end