class EventsController < ApplicationController
  def create
    event = Event.new(
      title: event_params[:title],
      start: event_params[:start],
      end: event_params[:end],
      editable: event_params[:editable],
      all_day: event_params[:all_day],
      color: event_params[:color],
      event_type: event_params[:event_type],
      background_color: event_params[:background_color],
      border_color: event_params[:border_color],
      text_color: event_params[:text_color],
      notes: event_params[:notes],
    )

    if event.save
      render json: ::EventSerializer.render_as_json(event, root: :event)
    else
      render json: { errors: event.errors }
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
        color: event_params[:color],
        event_type: event_params[:event_type],
        background_color: event_params[:background_color],
        border_color: event_params[:border_color],
        text_color: event_params[:text_color],
        notes: event_params[:notes],
      )

      render json: ::EventSerializer.render_as_json(event, root: :event)
    else
      render json: event.errors
    end
  end

  def show
    event = Event.find(params[:id])
    render json: ::EventSerializer.render_as_json(event, root: :event)
  end

  def index
    events = Event.all
    render json: ::EventSerializer.render_as_json(events, root: :events)
  end

  def destroy
    Event.find(params[:id]).destroy
    head :ok
  end

  private def event_params
    params[:event]
  end
end
