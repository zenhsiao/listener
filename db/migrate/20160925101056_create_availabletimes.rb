class CreateAvailabletimes < ActiveRecord::Migration[5.0]
  def change
    create_table :availabletimes do |t|
    	t.datetime :time_start
    	t.datetime :time_end
      t.timestamps
    end
  end
end
