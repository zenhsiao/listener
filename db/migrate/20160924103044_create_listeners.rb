class CreateListeners < ActiveRecord::Migration[5.0]
  def change
    create_table :listeners do |t|
    	t.string :name
    	t.string :description
    	t.integer :price
    	t.string :skype_id
    	t.string :email
      t.timestamps
    end

    add_attachment :listeners, :photo
  end
end
