class ShutdownStatusSerializer < Blueprinter::Base
  fields :id, :complete, :created_at, :week_day, :week_number, :week_year
end
