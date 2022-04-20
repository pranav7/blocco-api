class AddMeetingLinkToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :meeting_link, :string
    add_column :events, :creator, :string
  end
end
