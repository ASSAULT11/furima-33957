class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string       :postal_code,      null: false
      t.integer      :prefectures_id,   null: false
      t.string       :city,             null: false
      t.string       :address,          null: false
      t.string       :building,         null: false
      t.string       :phone,            null: false
      t.references   :purchase,         unique: true
      t.timestamps
    end
  end
end