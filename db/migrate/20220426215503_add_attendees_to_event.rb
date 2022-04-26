class AddAttendeesToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :attendees, :text
  end
end
