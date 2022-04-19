class RecurringEvent < ApplicationRecord
  serialize :days_of_week, Array

  belongs_to :event
end
