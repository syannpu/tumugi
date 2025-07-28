class CreateMarches < ActiveRecord::Migration[7.2]
  def change
    create_table :marches do |t|
      t.string :title, null: false, comment: "イベントのタイトル"
      t.text :body, null: false, comment: "イベントの詳細説明"
      t.references :user, foreign_key: true
      t.string :image, null: false, comment: "画像URL"
      t.string :location, null: false, comment: "イベントの場所"
      t.timestamps
      t.datetime :start_at, null: false, comment: "開始日時"
      t.datetime :end_at, null: false, comment: "終了日時"
    end
  end
end
