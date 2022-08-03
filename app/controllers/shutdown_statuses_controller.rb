class ShutdownStatusesController < ApplicationController
  def create
    shutdown_status = ShutdownStatus.new(
      complete: shutdown_status_params[:complete],
      week_day: shutdown_status_params[:week_day],
      week_number: shutdown_status_params[:week_number],
      week_year: shutdown_status_params[:week_year]
    )

    if shutdown_status.save
      render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
    else
      render json: { errors: shutdown_status.errors }
    end
  end

  def update
    shutdown_status = ShutdownStatus.where(
      week_day: shutdown_status_params[:week_day],
      week_number: shutdown_status_params[:week_number],
      week_year: shutdown_status_params[:week_year]
    ).first

    if shutdown_status.update(complete: shutdown_status_params[:complete])
      render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
    else
      render json: { errors: shutdown_status.errors }
    end
  end

  def show
    shutdown_status = ShutdownStatus.find(params[:id])
    render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
  end

  def index
    shutdown_statuses = ShutdownStatus.where(
      week_day: params[:week_day],
      week_number: params[:week_number],
      week_year: params[:week_year]
    )

    render json: ::ShutdownStatusSerializer.render_as_json(shutdown_statuses, root: :shutdown_statuses)
  end

  private

  def shutdown_status_params
    params[:shutdown_status]
  end
end
