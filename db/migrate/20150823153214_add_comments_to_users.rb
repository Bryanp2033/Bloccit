class AddCommentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comment, :string
    add_index :comments, :user_id
  end
end
