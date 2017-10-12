class AddFirstnameToUsers < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :firstname, :string
	 add_column :users, :lastname, :string
     add_column :users, :campus, :string
     add_column :users, :gender, :string
     add_column :users, :profilepic, :string

       add_index :users, :campus
  end
end