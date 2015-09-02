class AddUserIdtoComments < ActiveRecord::Migration
  def change

  	add_column(:comments, :user_id, :integer , index: true, foreign_key: true)
  end
end
