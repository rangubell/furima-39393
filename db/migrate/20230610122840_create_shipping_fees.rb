class CreateShippingFees < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_fees do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :shipping_fee_option_id, null: false


      t.timestamps
    end
  end
end
