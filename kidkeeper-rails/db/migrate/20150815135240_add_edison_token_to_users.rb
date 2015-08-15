class AddEdisonTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :edison_token, :string
  end
end
