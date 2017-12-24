class AddNameToInstitutes < ActiveRecord::Migration[5.0]
  def change
    add_column :institutes, :name, :string
  end
end
