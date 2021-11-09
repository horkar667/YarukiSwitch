class AddActionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :action, :string, default: "r1", null: false
  end
end
