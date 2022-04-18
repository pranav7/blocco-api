class EventsController < ApplicationController
  def create
    event = Event.new(
      title: event_params[:title],
      start: event_params[:start],
      end: event_params[:end],
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
        start: event_params[:start],
        end: event_params[:end],
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

  def destroy
    Event.find(params[:id]).destroy
    head :ok
  end

  private def event_params
    params[:event]
  end
end
