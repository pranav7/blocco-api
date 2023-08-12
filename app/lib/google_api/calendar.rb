require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"

module GoogleApi
  class Calendar

    APPLICATION_NAME = "Google Calendar API Ruby Quickstart".freeze
    # The file token.yaml stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    TOKEN_PATH = "config/google_user_token.yml".freeze if Rails.env.development?
    SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

    attr_reader :authorizer, :token_store, :client_id, :user_id

    def initialize
      @client_id = Google::Auth::ClientId.new(
        Rails.application.credentials.google.client_id,
        Rails.application.credentials.google.client_secret,
      )
      @token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
      @authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
      @user_id = "default"
    end

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    def authorize
      credentials = authorizer.get_credentials(user_id)

      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: "http://localhost:3000")
        puts "⚠️ Open the following URL in the browser and call call `GoogleApi::Calendar.create_credentials(code)` with the " \
            "resulting code after authorization:\n" + url
        return { succes: false, redirect_url: url, credentials: nil }
      end

      puts "✅ Authorized!"
      { success: true, credentials: credentials }
    end

    def create_credentials(code)
      authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: "http://localhost:3000"
      )
    end

    def calendar_client
      service = Google::Apis::CalendarV3::CalendarService.new
      service.client_options.application_name = APPLICATION_NAME
      service.authorization = authorize[:credentials]

      service
    end

    def test_api(calendar_id: "primary")
      # Fetch the next 10 events for the user
      response = calendar_client.list_events(calendar_id,
                                    max_results:   10,
                                    single_events: true,
                                    order_by:      "startTime",
                                    time_min:      DateTime.now.rfc3339)
      puts "Upcoming events:"
      puts "No upcoming events found" if response.items.empty?
      response.items.each do |event|
        start = event.start.date || event.start.date_time
        puts "- #{event.summary} (#{start})"
      end

      nil
    end

  end
end
