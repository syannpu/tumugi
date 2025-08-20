class AddScheduleAndLayoutToMarches < ActiveRecord::Migration[7.2]
  def change
    add_column :marches, :schedule, :text
    add_column :marches, :layout_image, :string
  end
end
