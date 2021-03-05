class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building
      t.string     :phone_number,  null: false
      t.references :shipping,      null: false, foreign_kye: true
      t.timestamps 
    end
  end
end
