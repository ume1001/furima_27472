class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,    null: false
      t.integer :area_id,        null: false
      t.integer :city,           null: false
      t.text    :prefectures,    null: false
      t.text    :building,       null: false
      t.string  :phone,          default: "",  null: false
      t.references :item,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
