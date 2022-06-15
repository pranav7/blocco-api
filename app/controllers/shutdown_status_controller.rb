class ShutdownStatusController < ApplicationController
  def create
    shutdown_status = ShutdownStatus.new(status: shutdown_status_params[:status])

    if shutdown_status.save
      render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
    else
      render json: { errors: shutdown_status.errors }
    end
  end

  def update
    shutdown_status = ShutdownStatus
      .where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))
      .first

    if shutdown_status.update(status: shutdown_status_params[:status])
      render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
    else
      render json: { errors: shutdown_status.errors }
    end
  end

  def show
    shutdown_status = ShutdownStatus
      .where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))
      .first

    render json: ::ShutdownStatusSerializer.render_as_json(shutdown_status, root: :shutdown_status)
  end

  private

  def shutdown_status_params
    params[:shutdown_status]
  end
end
