class CreateMarcheTargets < ActiveRecord::Migration[7.2]
  def change
    create_table :marche_targets do |t|
      t.references :marche, foreign_key: true
      t.references :target, foreign_key: true
      t.timestamps
    end
    add_index :marche_targets, [:marche_id, :target_id], unique: true
  end
end
