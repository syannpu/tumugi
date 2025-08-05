class AddProfileFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string
    add_column :users, :hometown, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :instagram, :string
  end
end
