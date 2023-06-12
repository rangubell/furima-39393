class Condition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition_option

  def self.condition_options
    Conditionoption.all
  end

  has_many :items
end
