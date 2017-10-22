class AddImageToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :image, :string
  end
end
