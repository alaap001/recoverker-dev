class AddDetailsToRequest < ActiveRecord::Migration[5.0]
  def change
   add_column :requests, :fathername, :string
    add_column :requests, :hsprogramme, :string
    add_column :requests, :hsuniversity, :string
    add_column :requests, :hsemployer, :string
    add_column :requests,:year_of_exam,:integer
    add_column :requests,:semester,:integer

  end
end
