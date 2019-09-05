class RemovePollId < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_choices, :poll_id

  end
end
