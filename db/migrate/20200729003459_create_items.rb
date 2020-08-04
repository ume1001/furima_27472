class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false, default: ""
      t.text :text,                 null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :deliveryFee_id,    null: false
      t.integer :area_id,           null: false
      t.integer :deliveryTime_id,   null: false
      t.integer :price,             null: false
      t.integer :user_id,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
