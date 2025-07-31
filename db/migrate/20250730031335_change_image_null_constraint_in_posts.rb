class ChangeImageNullConstraintInPosts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :posts, :image, true
  end
end
