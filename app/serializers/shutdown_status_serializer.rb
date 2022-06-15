class ShutdownStatusSerializer < Blueprinter::Base
  fields :id, :status, :created_at, :updated_at
end
