module Calendar
  class Importer

    def sync_events(time_min:, time_max:)
      time_min ||= DateTime.now.beginning_of_day.rfc3339
      time_max ||= DateTime.now.end_of_day.rfc3339

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
          local_event.meeting_link = get_meeting_link(event)
          local_event.creator = get_creator_details(event)
          local_event.attendees = get_attenndees(event)
          local_event.notes = "#{ActionController::Base.helpers.strip_tags(event.description)}"
          local_event.save
        end
    end

    private

    def calendar_client
      @calendar_client ||= GoogleApi::Calendar.new.calendar_client
    end

    def get_creator_details(event)
      details = ''
      if event.organizer.try(:display_name).present?
        details << "#{event.organizer.display_name} "
        details << "(#{event.organizer.email})" if event.organizer.try(:email).present?
      else
        details << "#{event.organizer.email}" if event.organizer.try(:email).present?
      end

      details
    end

    def get_meeting_link(event)
      return if event.conference_data.nil?

      event.conference_data.entry_points.select { |ep| ep.entry_point_type == "video" }.first&.label
    end

    def get_attenndees(event)
      event.attendees.map(&:display_name).compact.uniq
    end

  end
end
