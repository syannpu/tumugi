class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true
      t.string :image 
      t.timestamps
    end
  end
end
