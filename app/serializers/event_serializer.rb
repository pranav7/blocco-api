class EventSerializer < Blueprinter::Base
  fields :id, :title, :start, :end, :event_type, :status, :editable, :all_day,
    :color, :background_color, :text_color, :border_color, :google_event_id,
    :notes, :meeting_link, :creator
end
