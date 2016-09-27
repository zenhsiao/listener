class CreateLikeships < ActiveRecord::Migration[5.0]
  def change
    create_table :likeships do |t|
    	t.integer :listener_id
    	t.integer :user_id
      t.timestamps
    end

    add_index :likeships, :user_id
  end
end
