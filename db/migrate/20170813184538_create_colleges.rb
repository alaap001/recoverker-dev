class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :request_extras

      t.timestamps
    end
  end
end