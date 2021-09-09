class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.integer :access_type
    end
  end
end
