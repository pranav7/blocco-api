class GoogleCalendarController < ApplicationController
  def sync_todays_events
    importer = Calendar::Importer.new
    importer.sync_todays_events

    head :ok
  end

  def authorize
    google_api = GoogleApi::Calendar.new
    result = google_api.authorize

    if result[:succes]
      head :ok
    else
      render json: result.to_json
    end
  end

  def oauth_callback
    google_api = GoogleApi::Calendar.new
    google_api.create_credentials(params[:code])

    head :ok
  end
end
