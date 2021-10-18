class CreateWordComments < ActiveRecord::Migration[5.2]
  def change
    create_table :word_comments do |t|
      t.integer :user_id
      t.integer :word_id
      t.text :comment

      t.timestamps
    end
  end
end
