class AddBlocksToWeeklyNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :weekly_notes, :blocks, :text, default: '[]'
  end
end
