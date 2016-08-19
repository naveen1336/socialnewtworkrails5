class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps null: false
    end
    add_index :friend_requests, :user_id
    add_index :friend_requests, :friend_id
    
    
  end
end
