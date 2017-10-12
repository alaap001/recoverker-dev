class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.references :request, foreign_key: true
      t.string :current_status, default: "Reviewing Application"
      t.boolean :passed , default: false

      t.timestamps
    end
  end
end