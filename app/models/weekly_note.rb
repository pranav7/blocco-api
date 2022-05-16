class WeeklyNote < ApplicationRecord
  validates :start_date, :end_date, presence: true
end
