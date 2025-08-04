class CreateMarchePrices < ActiveRecord::Migration[7.2]
  def change
    create_table :marche_prices do |t|
      t.references :marche, foreign_key: true
      t.references :price, foreign_key: true
      t.timestamps
    end
    add_index :marche_prices, [:marche_id, :price_id], unique: true
  end
end
