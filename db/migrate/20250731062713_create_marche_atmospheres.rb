class CreateMarcheAtmospheres < ActiveRecord::Migration[7.2]
  def change
    create_table :marche_atmospheres do |t|
      t.references :marche, foreign_key: true
      t.references :atmosphere, foreign_key: true
      t.timestamps
    end
    add_index :marche_atmospheres, [:marche_id, :atmosphere_id], unique: true
  end
end


