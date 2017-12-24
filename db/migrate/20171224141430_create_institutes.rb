class CreateInstitutes < ActiveRecord::Migration[5.0]
  def change
    create_table :institutes do |t|
      t.references :college
      t.integer :recfee

      t.timestamps
    end
  end
end
