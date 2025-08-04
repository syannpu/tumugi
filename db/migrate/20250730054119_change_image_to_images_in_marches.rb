class ChangeImageToImagesInMarches < ActiveRecord::Migration[7.2]
  def change
    remove_column :marches, :image, :string

    # 新しいimagesカラム（配列型）を追加
    add_column :marches, :images, :string, array: true, default: []
  end
end
