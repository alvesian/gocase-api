class AddBatchIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :batch_id, :integer
  end
end
