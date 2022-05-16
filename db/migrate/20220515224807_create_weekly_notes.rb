class CreateWeeklyNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_notes do |t|
      t.text :notes
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps

      t.index %i[start_date end_date], unique: true
    end
  end
end
