class AddWeekNumberWeekYearToWeeklyNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :weekly_notes, :week_number, :integer
    add_column :weekly_notes, :week_year, :integer
    add_index :weekly_notes, [:week_year, :week_number], unique: true
  end
end
