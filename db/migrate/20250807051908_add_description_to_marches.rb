class AddDescriptionToMarches < ActiveRecord::Migration[7.2]
  def change
    add_column :marches, :description, :string
  end
end
