class CreateShippingDurations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_durations do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :shipping_duration_option_id, null: false


      t.timestamps
    end
  end
end
