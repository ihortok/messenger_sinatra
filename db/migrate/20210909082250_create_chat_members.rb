class CreateChatMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_members do |t|
      t.references :chat
      t.references :user
      t.boolean :admin

      t.timestamps
    end
  end
end
