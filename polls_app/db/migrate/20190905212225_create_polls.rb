class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title, null: false, unique: true
      t.integer :author_id, null: false
    end
    add_index :polls, :author_id
  end
end
