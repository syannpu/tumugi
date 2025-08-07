class ChangeCommentsForMarchesDatetime < ActiveRecord::Migration[7.2]
  def change
    change_column_comment :marches, :start_at, "出品募集開始"
    change_column_comment :marches, :end_at, "出品募集終了"
  end
end
