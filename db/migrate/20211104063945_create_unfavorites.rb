class CreateUnfavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :unfavorites do |t|
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
