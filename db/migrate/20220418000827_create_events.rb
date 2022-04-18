class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :start_time
      t.string :end_time
      t.datetime :start_recur
      t.datetime :end_recur
      t.string :days_of_week
      t.integer :event_type, default: 0
      t.integer :event_category, default: 0
      t.boolean :editable, default: true
      t.boolean :all_day, default: false
      t.string :color
      t.string :background_color
      t.string :border_color
      t.string :text_color

      t.timestamps
    end
  end
end
