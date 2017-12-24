class AddInstituteToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :institute_id, :integer
  end
end
