class AddSellerInfoToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :shop_name, :string
    add_column :users, :products, :text
    add_column :users, :experience, :string
    add_column :users, :contact_info, :string
    add_column :users, :self_pr, :text
  end
end
