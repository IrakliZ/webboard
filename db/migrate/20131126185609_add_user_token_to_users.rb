class AddUserTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_token, :string
  	add_index  :users, :user_token
  end
end
