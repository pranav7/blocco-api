module Calendar
  class Importer
    include ActionView::Helpers::SanitizeHelper

    def sync_events(time_min:, time_max:)
      time_min = time_min || DateTime.now.beginning_of_day.rfc3339
      time_max = time_max || DateTime.now.end_of_day.rfc3339

      calendar_client
        .list_events("primary", single_events: true, time_min: time_min, time_max: time_max)
        .items.each do |event|
          next if event.status == "cancelled" || event.status == "tentative"

          local_event = Event.find_or_initialize_by(google_event_id: event.id)
          local_event.title = event.summary
          local_event.start = event.start.date_time
          local_event.end = event.end.date_time
          local_event.event_type = Event.event_types[event.event_type] if event.try(:event_type).present?
          local_event.status = Event.statuses[event.status]
          local_event.background_color = "#ffcdb3"
          local_event.border_color = "#fe7032"
          local_event.text_color = "#ca3800"
          local_event.notes = build_notes_from_event(event)
          local_event.save
        end
    end

    private def calendar_client
      @calendar_client ||= GoogleApi::Calendar.new.calendar_client
    end

    private def build_notes_from_event(event)
      organizer_by = organizer_details(event)
      notes = "Organised by: #{organizer_by}\n\n" if organizer_by.present?
      notes << "#{sanitize(event.description, tags: [])}"

      notes
    end

    private def organizer_details(event)
      details = ""
      details << "#{event.organizer.display_name} " if event.organizer.try(:display_name).present?
      details << "(#{event.organizer.email})" if event.organizer.try(:email).present?

      details
    end

  end
end
