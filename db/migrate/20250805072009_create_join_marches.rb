class CreateJoinMarches < ActiveRecord::Migration[7.2]
  def change
    create_table :join_marches do |t|
      t.references :marche, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :approval_status, default: 0, null: false
    
      t.timestamps
    end
  end
end
