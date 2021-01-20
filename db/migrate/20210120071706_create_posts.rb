class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :prefecture, null: false
      t.string :area
      t.text :content, null: false
      t.string :url
      t.timestamps
    end
  end
end
