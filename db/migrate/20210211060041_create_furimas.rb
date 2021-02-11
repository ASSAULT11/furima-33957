class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.text         :item,         null: false
      t.text         :text,         null: false
      t.integer      :category_id,  null: false
      t.integer      :state_id,     null: false
      t.integer      :shipping_id,  null: false
      t.integer      :area_id,      null: false
      t.integer      :send_day_id,  null: false
      t.integer      :price,        null: false
      t.references   :user,         foreign_key: true
      t.timestamps
    end
  end
end