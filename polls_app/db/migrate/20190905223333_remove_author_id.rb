class RemoveAuthorId < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_choices, :author_id
    remove_column :questions, :author_id
  end
end
