class CreateRecurringEvent < ActiveRecord::Migration[7.0]
  def change
    create_table :recurring_events do |t|
      t.references :event, null: false, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.datetime :start_recur
      t.datetime :end_recur
      t.string :days_of_week

      t.timestamps
    end
  end
end
