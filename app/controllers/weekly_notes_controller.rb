class WeeklyNotesController < ApplicationController
  before_action :set_weekly_note, only: %i[ show update destroy ]

  # GET /weekly_notes
  def index
    @weekly_notes = WeeklyNote.where(week_year: params[:week_year], week_number: params[:week_number])

    render json: ::WeeklyNoteSerializer.render_as_json(@weekly_notes, root: :weekly_notes)
  end

  # GET /weekly_notes/1
  def show
    render json: ::WeeklyNoteSerializer.render_as_json(@weekly_note, root: :weekly_note)
  end

  # POST /weekly_notes
  def create
    @weekly_note = WeeklyNote.new(
      start_date: params[:weekly_note][:start_date],
      end_date: params[:weekly_note][:end_date],
      week_number: params[:weekly_note][:week_number],
      week_year: params[:weekly_note][:week_year],
      blocks: params[:weekly_note][:blocks] || [{ type: 'paragraph', data: { text: "" } }]
    )

    if @weekly_note.save
      render json: ::WeeklyNoteSerializer.render_as_json(@weekly_note, root: :weekly_note), status: :created, location: @weekly_note
    else
      render json: @weekly_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weekly_notes/1
  def update
    if @weekly_note.update(
      start_date: params[:weekly_note][:start_date],
      end_date: params[:weekly_note][:end_date],
      week_number: params[:weekly_note][:week_number],
      week_year: params[:weekly_note][:week_year],
      blocks: params[:weekly_note][:blocks]
    )
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
end
