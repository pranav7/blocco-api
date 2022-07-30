class WeeklyNoteSerializer < Blueprinter::Base
  fields :id, :start_date, :end_date, :notes, :blocks
end
