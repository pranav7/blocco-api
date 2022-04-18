class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :editable
      t.boolean :all_day
      t.text :color_hex

      t.timestamps
    end
  end
end
