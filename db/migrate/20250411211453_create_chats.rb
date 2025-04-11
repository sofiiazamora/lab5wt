class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false

      t.timestamps null: false
    end
    
    add_index :chats, :sender_id
    add_index :chats, :receiver_id
  end
end