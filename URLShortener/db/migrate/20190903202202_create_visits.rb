class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :visit_count 
      t.integer :user_id
      t.string :short_url
      t.timestamps
    end
  end
end
