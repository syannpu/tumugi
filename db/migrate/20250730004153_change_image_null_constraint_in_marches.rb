class ChangeImageNullConstraintInMarches < ActiveRecord::Migration[7.2]
  def change
    change_column_null :marches, :image, true
  end
end
