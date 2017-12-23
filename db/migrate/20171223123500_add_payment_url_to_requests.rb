class AddPaymentUrlToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :payment_url, :string
  end
end
