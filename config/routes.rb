Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  put "/google_calendar/sync_events" => "google_calendar#sync_events"
  get "/authorize" => "google_calendar#authorize"
  get "/oauth2callback" => "google_calendar#oauth_callback"

  resources :weekly_notes
  resources :events
  resources :shutdown_statuses, only: [:create, :update, :show, :index]
end
