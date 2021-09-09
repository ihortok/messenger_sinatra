class CreateChatMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_members do |t|
      t.belongs_to :chat
      t.belongs_to :user
    end
  end
end
