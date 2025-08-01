class CreateAtmospheres < ActiveRecord::Migration[7.2]
  def change
    create_table :atmospheres do |t|
      t.string :name

      t.timestamps
    end
  end
end
