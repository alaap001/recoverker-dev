class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :college, foreign_key: true
      t.references :user , foreign_key: true
      t.string :fullname
      t.string :email
      t.string :contact
      t.string :reason
      t.string :address_1
      t.string :address_2
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :enrollment_no
      t.string :batch
      t.string :course
      t.text :extras
      

      t.timestamps
    end
    add_index :requests , :email
  end
end
