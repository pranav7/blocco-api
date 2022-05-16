class WeeklyNotesController < ApplicationController
  before_action :set_weekly_note, only: %i[ show update destroy ]

  # GET /weekly_notes
  def index
    @weekly_notes = WeeklyNote.where(start_date: params[:start_date], end_date: params[:end_date])

    render json: ::WeeklyNoteSerializer.render_as_json(@weekly_notes, root: :weekly_notes)
  end

  # GET /weekly_notes/1
  def show
    render json: ::WeeklyNoteSerializer.render_as_json(@weekly_note, root: :weekly_note)
  end

  # POST /weekly_notes
  def create
    @weekly_note = WeeklyNote.new(weekly_note_params)

    if @weekly_note.save
      render json: ::WeeklyNoteSerializer.render_as_json(@weekly_note, root: :weekly_note), status: :created, location: @weekly_note
    else
      render json: @weekly_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weekly_notes/1
  def update
    if @weekly_note.update(weekly_note_params)
      render json: ::WeeklyNoteSerializer.render_as_json(@weekly_note, root: :weekly_note)
    else
      render json: @weekly_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weekly_notes/1
  def destroy
    @weekly_note.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weekly_note
    @weekly_note = WeeklyNote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weekly_note_params
    params.require(:weekly_note).permit(:notes, :start_date, :end_date)
  end
end
