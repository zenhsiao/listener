class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.integer :listener_id
    	t.integer :user_id
    	t.integer :price
    	t.integer :quantity
    	t.integer :subtotal

      t.timestamps
    end
  end
end
