class RemoveStartDateEndDateFromWeeklyNotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :weekly_notes, :start_date
    remove_column :weekly_notes, :end_date
  end
end
