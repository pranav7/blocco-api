class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :event_type, default: 0
      t.integer :status, default: 0
      t.boolean :editable, default: true
      t.boolean :all_day, default: false
      t.string :color
      t.string :background_color
      t.string :border_color
      t.string :text_color
      t.string :google_event_id

      t.timestamps

      t.index :google_event_id, unique: true
    end
  end
end
