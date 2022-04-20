class AddNotesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :notes, :text
  end
end
