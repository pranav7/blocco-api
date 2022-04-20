class GoogleCalendarController < ApplicationController
  def sync_events
    importer = Calendar::Importer.new
    importer.sync_events(time_min: params[:time_min], time_max: params[:time_max])

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
