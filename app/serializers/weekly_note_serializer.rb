class WeeklyNoteSerializer < Blueprinter::Base
  fields :id, :start_date, :end_date, :week_number, :week_year, :notes, :blocks
end
