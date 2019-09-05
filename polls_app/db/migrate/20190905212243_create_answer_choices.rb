class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.string :text, null: false, unique: true
      t.integer :author_id, null: false
      t.integer :poll_id, null: false
      t.integer :question_id, null: false
    end
    add_index :answer_choices, :author_id
    add_index :answer_choices, :poll_id
    add_index :answer_choices, :question_id

  end
end
