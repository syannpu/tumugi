class AddVenueToMarches < ActiveRecord::Migration[7.2]
  def change
    add_column :marches, :venue, :string
  end
end
