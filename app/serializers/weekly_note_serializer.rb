class WeeklyNoteSerializer < Blueprinter::Base
  fields :id, :week_number, :week_year, :notes, :blocks
end
