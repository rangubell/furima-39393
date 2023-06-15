class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id, :token,
                :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, exclusion: { in: [1], message: 'must be selected' }
    validates :municipality
    validates :address
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )
    shipping_address = ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
