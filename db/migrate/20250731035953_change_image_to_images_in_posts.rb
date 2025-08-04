class ChangeImageToImagesInPosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :image, :string

    # 新しいimagesカラム（配列型）を追加
    add_column :posts, :images, :string, array: true, default: []
  end
end
