class CreateListenerTimeships < ActiveRecord::Migration[5.0]
  def change
    create_table :listener_timeships do |t|
    	t.integer :listener_id
    	t.integer :availabletime_id
    	t.integer :order_id
      t.timestamps
    end
    add_index :listener_timeships, :listener_id
    add_index :listener_timeships, :order_id

  end
end
