class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :reference
      t.string :purchase_channel
      t.string :client_name
      t.string :address
      t.string :delivery_service
      t.integer :total_value
      t.string :line_items
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
