class AddHeldAtToMarches < ActiveRecord::Migration[7.2]
  def change
    add_column :marches, :held_at, :datetime
  end
end
