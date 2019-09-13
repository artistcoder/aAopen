class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :artwork_id
      t.string :body
    end
    add_index :comments, :author_id
    add_index :comments, :artwork_id

  end
end
