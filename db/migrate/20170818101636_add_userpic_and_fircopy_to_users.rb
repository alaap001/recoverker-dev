class AddUserpicAndFircopyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :fircopy, :string
    add_column :users, :userpic, :string
  end
end
