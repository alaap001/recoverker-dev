class AddInstituteToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :institute, :reference
  end
end
