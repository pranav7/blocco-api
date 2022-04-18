class EventsController < ApplicationController
  def create
    event = Event.new(
      title: event_params[:title],
      start_at: event_params[:start_at],
      end_at: event_params[:end_at],
      editable: event_params[:editable],
      all_day: event_params[:all_day],
      color_hex: event_params[:color_hex],
      event_type: event_params[:event_type],
    )

    if event.save
      render json: { event: event }
    else
      render json: event.errors
    end
  end

  def update
    event = Event.find(params[:id])

    if event.update(
        title: event_params[:title],
        start_at: event_params[:start_at],
        end_at: event_params[:end_at],
        editable: event_params[:editable],
        all_day: event_params[:all_day],
        color_hex: event_params[:color_hex],
        event_type: event_params[:event_type],
      )
      render json: event
    else
      render json: event.errors
    end
  end

  def show
    render json: { event: Event.find(params[:id]) }
  end

  def index
    render json: { events: Event.all }
  end

  private def event_params
    params[:event]
  end
end
