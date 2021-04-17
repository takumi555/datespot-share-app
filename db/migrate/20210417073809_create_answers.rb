class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false
      t.references :user, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
