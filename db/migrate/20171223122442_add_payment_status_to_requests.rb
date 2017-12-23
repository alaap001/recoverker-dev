class AddPaymentStatusToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :payment_status, :string
    add_column :requests, :payment_id, :string
    remove_column :requests , :year_of_exam ,:integer
  end
end
