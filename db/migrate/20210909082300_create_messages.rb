class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender, index: true, foreign_key: { to_table: :users }
      t.references :receiver, index: true, foreign_key: { to_table: :users }
      t.references :chat
      t.boolean :seen

      t.timestamps
    end
  end
end
