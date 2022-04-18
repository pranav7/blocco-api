class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.integer :event_type
      t.boolean :editable
      t.boolean :all_day
      t.text :color_hex

      t.timestamps
    end
  end
end
